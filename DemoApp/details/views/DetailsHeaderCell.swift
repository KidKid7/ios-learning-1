//
//  DetailsHeaderCell.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import UIKit

class DetailsHeaderCell: UITableViewCell {

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupData(vm: HeaderRowManaging) {
        nameLabel.text = vm.name
        
        let defaultImage = UIImage(named: "placeholder")
        if let url = vm.imageURL {
            mealImageView.af.setImage(withURL: url, placeholderImage: defaultImage)
        } else {
            mealImageView.image = defaultImage
        }
    }
}

private extension DetailsHeaderCell {
    func setupViews() {
        
    }
}
