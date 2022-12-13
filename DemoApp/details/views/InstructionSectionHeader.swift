//
//  InstructionSectionHeader.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import UIKit

class InstructionSectionHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
}

private extension InstructionSectionHeader {
    func setupViews() {
        headerLabel.text = "Instruction"
    }
}
