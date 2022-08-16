//
//  SubViewController.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/16.
//

import UIKit

final class SubViewController: UIViewController {
    
    private let subCollectionViewNibName = "SubCollectionViewCell"
    private let subCollectionViewIdentifier = "SubCollectionViewCell"
    
    @IBOutlet private weak var subCollectionView: UICollectionView! {
        didSet {
            subCollectionView.dataSource = self
            subCollectionView.delegate = self
            subCollectionView.register(UINib(nibName: subCollectionViewNibName, bundle: nil), forCellWithReuseIdentifier: subCollectionViewIdentifier)
            subCollectionView.showsHorizontalScrollIndicator = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SubViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = subCollectionView.dequeueReusableCell(withReuseIdentifier: subCollectionViewIdentifier, for: indexPath) as? SubCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

extension SubViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = subCollectionView.cellForItem(at: indexPath) as? SubCollectionViewCell {
            cell.categoryLabel.textColor = .red
            cell.borderView.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = subCollectionView.cellForItem(at: indexPath) as? SubCollectionViewCell {
            cell.categoryLabel.textColor = .lightGray
            cell.borderView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}
