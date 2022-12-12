//
//  MealDetailsVC.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

import UIKit

class MealDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MealDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MealDetailsVC: UITableViewDelegate {
    
}
