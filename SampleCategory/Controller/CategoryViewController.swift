//
//  CategoryViewController.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/16.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    private let collectionViewNibName = "CategoryCollectionViewCell"
    private let collectionViewIdentifier = "CategoryCollectionViewCell"
    private let categories = CategoryModel()
    
    @IBOutlet private weak var categoryCollectionView: UICollectionView! {
        didSet {
            categoryCollectionView.dataSource = self
            categoryCollectionView.delegate = self
            categoryCollectionView.register(UINib(nibName: collectionViewNibName, bundle: nil), forCellWithReuseIdentifier: collectionViewIdentifier)
            categoryCollectionView.showsHorizontalScrollIndicator = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: collectionViewIdentifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = categoryCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.categoryImageView.layer.borderColor = UIColor.red.cgColor
            cell.categoryLabel.textColor = .red
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = categoryCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.categoryImageView.layer.borderColor = UIColor.lightGray.cgColor
            cell.categoryLabel.textColor = .lightGray
        }
    }
}
