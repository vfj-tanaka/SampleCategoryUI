//
//  SubCollectionViewCell.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/16.
//

import UIKit

final class SubCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 15
    }
}
