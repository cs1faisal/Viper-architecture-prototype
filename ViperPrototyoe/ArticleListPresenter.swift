//
//  ArticleListPresenter.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation
import UIKit

class ArticleListPresenter: ArticleListPresenterProtocol {
    
    var articles: [Article] = [] {
        willSet {
               view?.hideLoading()
        }
        didSet {
            view?.reloadData()
            injectSortButton()
        }
    }
    
    var view: ArticleListViewProtocol?
    
    var interactor: ArticleListInteractorInputProtocol?
    
    var router: ArticleListRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveArticleList()
    }
    
    
    func showDetailForArticle(atIndexPath indexPath: IndexPath) {
        router?.presentArticleDetailScreen(from: view!, forArticle: articles[indexPath.row])
    }
    
    func numberOfArticle(InSection section: Int) -> Int {
        if section == 0 {
            return articles.count
        }
        return 0
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func dataForArticle(atIndexPath indexPath: IndexPath) -> ArticleCellViewModel {
        let article = articles[indexPath.row]
        let articleCellModel = ArticleCellViewModel(title: article.title, image_url: article.image_url, authorsLabel: article.authors)
        return articleCellModel
    }
    
    @objc func sortArticles() {
        router?.presentSortOptions(inView: self.view!,sortCompletion: { (sortType) in
            self.sortArticlesList(sortBy: sortType)
        })
    }
    
    fileprivate func sortArticlesList(sortBy: ArticlesSortType) {
        switch sortBy {
        case .date:
            articles.sort(by: { ($0.date ) < ($1.date) })
        case .title:
            articles.sort(by: { ($0.title) < ($1.title) })
        case .author:
            articles.sort(by: { ($0.authors) < ($1.authors) })
        case .website:
            articles.sort(by: { ($0.website) < ($1.website) })
        case .none: break
        }
        if sortBy != .none {
            view?.reloadData()
        }
    }
    
    fileprivate func injectSortButton() {
        if let view = self.view as? UIViewController {
            let sortButton = UIBarButtonItem(
                title: "Sort",
                style: .plain,
                target: self,
                action: #selector(sortArticles)
            )
            view.navigationItem.rightBarButtonItem = sortButton
            view.navigationController?.navigationItem.setRightBarButton(sortButton, animated: false)
        }
    }
    
}


extension ArticleListPresenter:ArticleListInteractorOutputProtocol {
    
    func onError(error: Error) {
        view?.showError()
    }
    
    func didRetrieveArticles(_ articles: [Article]?) {
        if let articles = articles {
            self.articles = articles
        }
    }
}
