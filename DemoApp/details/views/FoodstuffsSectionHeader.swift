//
//  FoodstuffsSectionHeader.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import UIKit

class FoodstuffsSectionHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
}

private extension FoodstuffsSectionHeader {
    func setupViews() {        
        ingredientLabel.text = "Ingredient"
        measurementLabel.text = "Measurement"
    }
}
