//
//  MealDetailsVC.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

import UIKit
import Combine

class MealDetailsVC: UIViewController {
    
    enum Section: Int, CaseIterable {
        case header
        case instruction
        case foodstuff
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private let input: PassthroughSubject<MealDetailsVM.Input, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    private var vm: MealDetailsManaging!
    
    init(vm: MealDetailsManaging) {
        super.init(nibName: MealDetailsVC.identifier, bundle: nil)
        self.vm = vm
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind()
        input.send(.viewDidLoad)
    }
    
    private func bind() {
        let output = vm.transform(input: input.eraseToAnyPublisher())
        output.receive(on: DispatchQueue.main)
            .sink { [weak self] event in
            switch event {
            case .loadDetailsDidSucceed:
                self?.tableView.reloadData()
            case .loadDetailsDidFail(let error):
                debugPrint(error)
            }
        }.store(in: &cancellables)
    }
}

// MARK: UIs
private extension MealDetailsVC {
    func setupView() {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomSafeAreaHeight, right: 0)
        tableView.register(nibCell: DetailsHeaderCell.self)
        tableView.register(nibCell: InstructionCell.self)
        tableView.register(nibCell: FoodstuffCell.self)
        tableView.registerHeaderFooter(nibView: InstructionSectionHeader.self)
        tableView.registerHeaderFooter(nibView: FoodstuffsSectionHeader.self)
    }
}

extension MealDetailsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        
        if section == .foodstuff {
            return vm.foodstuffVM.numberOfRows
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        if section == .header {
            let cell = tableView.dequeue(cell: DetailsHeaderCell.self, at: indexPath)
            cell.setupData(vm: vm.headerVM)
            return cell
            
        } else if section == .instruction {
            let cell = tableView.dequeue(cell: InstructionCell.self, at: indexPath)
            cell.setupData(vm: vm.instructionVM)
            return cell
            
        } else if section == .foodstuff {
            let cell = tableView.dequeue(cell: FoodstuffCell.self, at: indexPath)
            cell.setupData(vm: vm.foodstuffVM, atRow: indexPath.row)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if Section(rawValue: section) == .header {
            return .leastNormalMagnitude
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tableSection = Section(rawValue: section)
        if tableSection == .instruction {
            return tableView.dequeueHeaderFooter(view: InstructionSectionHeader.self)
            
        } else if tableSection == .foodstuff {
            return tableView.dequeueHeaderFooter(view: FoodstuffsSectionHeader.self)
        }
        
        return nil
    }
}

extension MealDetailsVC: UITableViewDelegate {
    
}
