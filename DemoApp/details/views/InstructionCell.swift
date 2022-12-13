//
//  InstructionCell.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import UIKit

class InstructionCell: UITableViewCell {

    @IBOutlet weak var instuctionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupData(vm: InstructionRowManaging) {
        instuctionLabel.text = vm.instruction
    }
}

private extension InstructionCell {
    func setupViews() {
        
    }
}
