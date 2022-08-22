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
    let categories = ["すべてのトップス", "カットソー・Tシャツ", "ニット・セーター"]
    
    @IBOutlet private weak var subCollectionView: UICollectionView! {
        didSet {
            subCollectionView.dataSource = self
            subCollectionView.delegate = self
            subCollectionView.register(UINib(nibName: subCollectionViewNibName, bundle: nil), forCellWithReuseIdentifier: subCollectionViewIdentifier)
            subCollectionView.showsHorizontalScrollIndicator = false
            subCollectionView.backgroundColor = UIColor(hex: "F3F3F3")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SubViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = subCollectionView.dequeueReusableCell(withReuseIdentifier: subCollectionViewIdentifier, for: indexPath) as? SubCollectionViewCell else { return UICollectionViewCell() }
        let category = categories[indexPath.row]
        cell.configure(text: category)
        
        return cell
    }
}

extension SubViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = subCollectionView.cellForItem(at: indexPath) as? SubCollectionViewCell {
            cell.categoryLabel.textColor = UIColor(hex: "F44336")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = subCollectionView.cellForItem(at: indexPath) as? SubCollectionViewCell {
            cell.categoryLabel.textColor = UIColor(hex: "555555")
        }
    }
}

extension SubViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let category = categories[indexPath.row]
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = category
        let labelWidth = label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 31)).width + 30
        
        return .init(width: labelWidth, height: 31)
    }
}
