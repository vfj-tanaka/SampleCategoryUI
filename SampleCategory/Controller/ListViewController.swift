//
//  ListViewController.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/17.
//

import UIKit

protocol ListViewProtocol: AnyObject {
    
    func dismissListView()
    func getHeight(contentHeight: CGFloat)
}

final class ListViewController: UIViewController {
    
    @IBOutlet private weak var listTableView: UITableView! {
        didSet {
            listTableView.dataSource = self
            listTableView.delegate = self
            listTableView.register(UINib(nibName: listTableViewNibName, bundle: nil), forCellReuseIdentifier: listTableViewIdentifier)
            listTableView.showsHorizontalScrollIndicator = false
            listTableView.isScrollEnabled = false
        }
    }
    
    @IBOutlet weak var listTableViewHeight: NSLayoutConstraint!
    
    private let listTableViewNibName = "ListTableViewCell"
    private let listTableViewIdentifier = "ListTableViewCell"
    weak var delegate: ListViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let tableViewHeight = CGFloat(listTableView.contentSize.height)
        listTableViewHeight.constant = tableViewHeight
        let contentHeight = tableViewHeight + 50
        delegate?.getHeight(contentHeight: contentHeight)
    }
    
    @IBAction private func dismiss(_ sender: Any) {
        
        delegate?.dismissListView()
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = listTableView.dequeueReusableCell(withIdentifier: listTableViewIdentifier) as? ListTableViewCell else { return UITableViewCell() }
            
            return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        listTableView.deselectRow(at: indexPath, animated: true)
    }
}
