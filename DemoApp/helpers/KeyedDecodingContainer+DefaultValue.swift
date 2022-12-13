//
//  KeyedDecodingContainer+IfPresent.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

extension KeyedDecodingContainer {
    func decodeString(forKey key: KeyedDecodingContainer.Key) -> String {
        guard let decoded: String = try? decodeIfPresent(String.self, forKey: key) else { return "" }
        return decoded
    }
}
