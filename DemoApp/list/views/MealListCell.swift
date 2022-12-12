//
//  MealListCell.swift
//  DemoApp
//
//  Created by Kid Kid on 12/4/22.
//

import UIKit
import AlamofireImage

protocol MealListCellManaging {
    var name: String { get }
    var imageURL: URL? { get }
}

class MealListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override var isHighlighted: Bool {
        didSet {
            highlighted(isHighlighted, scaleRate: 0.9, duration: 0.2)
        }
    }
        
    func setupData(vm: MealListCellManaging) {
        titleLabel.text = vm.name
        
        let defaultImage = UIImage(named: "placeholder")
        if let url = vm.imageURL {
            imageView.af.setImage(withURL: url, placeholderImage: defaultImage)
        } else {
            imageView.image = defaultImage
        }
    }
}

private extension MealListCell {
    func setupViews() {
        titleLabel.text = ""
    }
}
