//
//  ArticleListProtocol.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation
import UIKit

//MARK: PRESENTER -> VIEW
protocol ArticleListViewProtocol: class {
    var presenter: ArticleListPresenterProtocol? { get set }
    
    func reloadData()
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

//MARK: PRESENTER -> ROUTER
protocol ArticleListRouterProtocol: class {
    static func createArticleListModule() -> UIViewController
    func presentArticleDetailScreen(from view: ArticleListViewProtocol, forArticle article: Article)
    func presentSortOptions(inView view:ArticleListViewProtocol, sortCompletion: ((ArticlesSortType) -> ())?)
}

// MARK: VIEW -> PRESENTER
protocol ArticleListPresenterProtocol: class {
    
    var view: ArticleListViewProtocol? { get set }
    var interactor: ArticleListInteractorInputProtocol? { get set }
    var router: ArticleListRouterProtocol? { get set }
    var articles:[Article] {get set}
    
    func viewDidLoad()
    func showDetailForArticle(atIndexPath indexPath:IndexPath)
    
    func numberOfArticle(InSection section:Int) -> Int
    func numberOfSection() -> Int
    func dataForArticle(atIndexPath indexPath:IndexPath) -> ArticleCellViewModel
}

// MARK: INTERACTOR -> PRESENTER
protocol ArticleListInteractorOutputProtocol: class {
    func didRetrieveArticles(_ articles: [Article]?)
    func onError(error:Error)
}

// MARK: PRESENTER -> INTERACTOR
protocol ArticleListInteractorInputProtocol: class {
    var presenter: ArticleListInteractorOutputProtocol? { get set }
    func retrieveArticleList()
}


