//
//  InstructionRowVM.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

protocol InstructionRowManaging {
    var instruction: String { get }
}

extension DetailsRowVM: InstructionRowManaging {
    var instruction: String {
        return mealDetails.instruction
    }
}
