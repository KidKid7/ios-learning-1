//
//  MealListSectionHeaderView.swift
//  DemoApp
//
//  Created by Kid Kid on 12/4/22.
//

import UIKit

protocol MealListHeaderManaging {
    var sectionTitle: String { get }
}

class MealListSectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupData(vm: MealListHeaderManaging) {
        titleLabel.text = vm.sectionTitle
    }
}

private extension MealListSectionHeaderView {
    func setupViews() {
        titleLabel.text = ""
    }
}
