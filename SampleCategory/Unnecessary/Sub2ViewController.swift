//
//  Sub2ViewController.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/17.
//

import UIKit

final class Sub2ViewController: UIViewController {
    
    private let subTableViewNibName = "SubTableViewCell"
    private let subTableViewIdentifier = "SubTableViewCell"
    private let sub2TableViewNibName = "Sub2TableViewCell"
    private let sub2TableViewIdentifier = "Sub2TableViewCell"
    
    @IBOutlet private weak var subTableView: UITableView! {
        didSet {
            subTableView.dataSource = self
            subTableView.delegate = self
            subTableView.register(UINib(nibName: subTableViewNibName, bundle: nil), forCellReuseIdentifier: subTableViewIdentifier)
            subTableView.register(UINib(nibName: sub2TableViewNibName, bundle: nil), forCellReuseIdentifier: sub2TableViewIdentifier)
            subTableView.showsHorizontalScrollIndicator = false
            subTableView.isScrollEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension Sub2ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = subTableView.dequeueReusableCell(withIdentifier: subTableViewIdentifier) as? SubTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}

extension Sub2ViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 51
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        subTableView.deselectRow(at: indexPath, animated: true)
    }
}
