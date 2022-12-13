//
//  FoodstuffCell.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import UIKit

class FoodstuffCell: UITableViewCell {

    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupData(vm: FoodstuffRowManaging, atRow row: Int) {
        ingredientLabel.text = vm.foodstuff(for: row).ingredient
        measurementLabel.text = vm.foodstuff(for: row).measurement
    }
}

private extension FoodstuffCell {
    func setupViews() {
        
    }
}
