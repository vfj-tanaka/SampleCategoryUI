//
//  SubCollectionViewCell.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/16.
//

import UIKit

final class SubCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 15
    }
}
