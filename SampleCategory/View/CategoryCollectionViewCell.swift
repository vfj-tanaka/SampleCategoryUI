//
//  CategoryCollectionViewCell.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/15.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImageView.backgroundColor = .white
        categoryImageView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        categoryImageView.layer.borderWidth = 1
        categoryImageView.layer.cornerRadius = 30
        categoryImageView.layer.masksToBounds = true
    }

}
