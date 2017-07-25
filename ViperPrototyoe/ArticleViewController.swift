//
//  ArticleViewController.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import UIKit


class ArticleViewController: UITableViewController{
    
    var presenter: ArticleListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.register(ArticleCellInfo.nib, forCellReuseIdentifier: ArticleCellInfo.id)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let presenter = self.presenter {
            return presenter.numberOfSection()
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let presenter = self.presenter {
            return presenter.numberOfArticle(InSection: section)
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCellInfo.id, for: indexPath) as! ArticleTableViewCell
        
        if let presenter = self.presenter {
            cell.setup(presenter.dataForArticle(atIndexPath: indexPath))
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailForArticle(atIndexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ArticleCellInfo.height
        
    }
 
}

extension ArticleViewController:ArticleListViewProtocol {
    
    func reloadData() {
        tableView.reloadData()
        let index = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: index, at: UITableViewScrollPosition.top, animated: true)
    }
    
    func showError() {
        self.title = "Data can't be loaded"
    }
    
    func showLoading() {
        self.title = "Loading..."
    }
    
    func hideLoading() {
        self.title = "Articles"
    }
}
