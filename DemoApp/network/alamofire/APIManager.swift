//
//  APIManager.swift
//  DemoApp
//
//  Created by Kid Kid on 12/4/22.
//

import UIKit
import Foundation
import Alamofire

struct APIManager {
    let baseURL: URL!
    let networkManager: Alamofire.Session
    
    init() {
        let urlString = "https://www.themealdb.com/api/"
        baseURL = URL(string: urlString)
        networkManager = Session()
    }
}

extension APIManager: APIManaging {
    func perform<T: Decodable>(of type: T.Type,
                               requestBuilder: RequestBuilding,
                               responseParser: ResponseParsing) {

    guard let url = url(builder: requestBuilder) else {
        responseParser.handleError(APIError.malformedUrl)
      return
    }
        
    var headers = defaultHeader
    requestBuilder.headers.forEach { h in
        let header = HTTPHeader(name: h.key, value: h.value)
        headers.add(header)
    }
        
    let dataRequest = networkManager.request(url,
                                             method: method(builder: requestBuilder),
                                             parameters: requestBuilder.parameters,
                                             encoding: encoding(builder: requestBuilder),
                                             headers: headers).validate()
    
    dataRequest.responseDecodable { (response: DataResponse<T, AFError>)  in
        switch response.result {
        case .success(let data):
            responseParser.handleSuccess(data)
        case .failure(let err):
            let error = err.underlyingError ?? APIError.unhandled
            responseParser.handleError(error)
        }
    }
  }
}

// MARK: Helpers
private extension APIManager {
    func url(builder: RequestBuilding) -> URL? {
        return URL(string: builder.apiVersion + builder.path, relativeTo: baseURL)
    }

    func method(builder: RequestBuilding) -> HTTPMethod {
        if (builder.method == .post) {
            return .post
        }
        
        return .get
    }
    
    func encoding(builder: RequestBuilding) -> ParameterEncoding {
        if (builder.encoding == .json) {
            return JSONEncoding.default
        }
        
        return URLEncoding.default
    }
    
    var defaultHeader: HTTPHeaders {
        var headers: HTTPHeaders = [:]
        headers["os"] = "ios"
        headers["os-version"] = UIDevice.current.systemVersion
        headers["client-version"] = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        headers["device-model"] = UIDevice.current.model
        
        return headers
    }
    
    static func isNetworkReachable() -> Bool {
        guard let networkReachability = NetworkReachabilityManager() else { return false }
        return networkReachability.isReachable
    }
}
