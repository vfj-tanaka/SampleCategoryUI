//
//  ViewController.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/15.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var listContainerView: UIView!
    @IBOutlet private weak var baseColorView: UIView! {
        didSet {
            baseColorView.backgroundColor = UIColor(hex: "F3F3F3")
        }
    }
    
    @IBOutlet private weak var backgroundView: UIView! {
        didSet {
            let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.backTapGesture(_:)))
            tapGestureRecognizer.delegate = self
            self.backgroundView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @IBOutlet private weak var subCategoryView: UIView! {
        didSet {
            let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapShowList(_:)))
            self.subCategoryView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @IBOutlet private weak var containerHeight: NSLayoutConstraint!
    @IBOutlet private weak var backgroundViewXConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func showList() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundView.isHidden = false
            self.backgroundViewXConstraint.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    private func dismissList() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundViewXConstraint.constant = self.view.frame.width
            self.view.layoutIfNeeded()
        }) { (_) in
            self.backgroundView.isHidden = true
        }
    }
    
    @objc private func tapShowList(_ sender: UITapGestureRecognizer) {
        
        showList()
    }
    
    @objc private func backTapGesture(_ sender: UITapGestureRecognizer) {
        
        dismissList()
    }
}

extension ViewController: ListViewProtocol {
    
    func getHeight(contentHeight: CGFloat) {
        
        containerHeight.constant = contentHeight
    }
    
    func dismissListView() {
        
        dismissList()
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view!.isDescendant(of: listContainerView)) {
            return false
        }
        return true
    }
}
