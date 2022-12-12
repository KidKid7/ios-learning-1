//
//  MealListVC.swift
//  DemoApp
//
//  Created by Kid Kid on 12/4/22.
//

import UIKit
import Combine

class MealListVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let input: PassthroughSubject<MealListVM.Input, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    private var vm: MealListManaging!
    
    init(vm: MealListManaging) {
        super.init(nibName: MealListVC.identifier(), bundle: nil)
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
            case .loadMealsDidSucceed:
                self?.collectionView.reloadData()
            case .loadMealsDidFail(let error):
                debugPrint(error)
            }
        }.store(in: &cancellables)
    }
}

// MARK: UIs
private extension MealListVC {
    func setupView() {
        title = "Dessert"
        setupNavigationBar()
        setupCollectioView()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .systemOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupCollectioView() {
        collectionView.register(nibCell: MealListCell.self)
        collectionView.register(header: MealListSectionHeaderView.self)
        
        setFlowLayout()
    }

    func setFlowLayout() {
        let inset: CGFloat = 5
        let fraction: CGFloat = 1 / 3
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction),
                                              heightDimension: .fractionalHeight(1.3) )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                     leading: inset,
                                                     bottom: inset,
                                                     trailing: inset)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(fraction * 1.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                        leading: 0,
                                                        bottom: inset,
                                                        trailing: 0)
        
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(44))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize,
                                                                     elementKind: UICollectionView.elementKindSectionHeader,
                                                                     alignment: .top)
        headerItem.pinToVisibleBounds = true
        section.boundarySupplementaryItems = [headerItem]
        
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        collectionView.setCollectionViewLayout(compositionalLayout, animated: true)
    }
}

// MARK: UICollectionViewDataSource
extension MealListVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return vm.sectionTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.meals(inSection: section).count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vm = MealListCellVM(meal: vm.meals(inSection: indexPath.section)[indexPath.row])
        let cell = collectionView.dequeue(cell: MealListCell.self, for: indexPath)
        cell.setupData(vm: vm)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let vm = MealListHeaderVM(title: vm.sectionTitles[indexPath.section])
        
        let header = collectionView.dequeueHeaderView(header: MealListSectionHeaderView.self, for: indexPath)
        header.setupData(vm: vm)
        return header
    }
}

// MARK: UICollectionViewDelegate
extension MealListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
