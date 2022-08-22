//
//  CategoryCollectionViewCell.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/15.
//

import UIKit
import Kingfisher

final class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    private let noImage = UIImage(named: "noImage")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImageView.layer.borderColor = UIColor(hex: "DDDDDD").cgColor
        categoryImageView.layer.borderWidth = 1
        categoryImageView.layer.cornerRadius = 35
        categoryLabel.textColor = UIColor(hex: "555555")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configure(image: String, text: String) {
        
        let image = URL(string: image)
        categoryImageView.kf.indicatorType = .activity
        categoryImageView.kf.setImage(with: image, placeholder: noImage, options: nil)
        categoryLabel.text = text
    }
}
