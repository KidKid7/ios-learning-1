//
//  UICollectionView+Nib.swift
//  DemoApp
//
//  Created by Kid Kid on 12/10/22.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(nibCell: T.Type) {
        register(T.nib(), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UICollectionViewCell>(nibCell: T.Type, with identifier: String) {
        register(T.nib(), forCellWithReuseIdentifier: identifier)
    }
    
    func register<T: UICollectionReusableView>(header: T.Type) {
            register(T.nib(),
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                     withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeue<T: UICollectionViewCell>(cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier,
                                   for: indexPath) as! T
    }
    
    func dequeueHeaderView<T: UICollectionReusableView>(header: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: T.reuseIdentifier,
                                                for: indexPath) as! T
    }
    
    
}
