//
//  ArticleListRouter.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation
import UIKit
class ArticleListRouter: ArticleListRouterProtocol {
    
    
    static func createArticleListModule() -> UIViewController {
        let navController = UIStoryboard(name: constantIdenfirs.mainStoryboard, bundle: Bundle.main).instantiateViewController(withIdentifier: constantIdenfirs.articlesNavigationController)
        if let view = navController.childViewControllers.first as? ArticleViewController {
            let presenter: ArticleListPresenterProtocol & ArticleListInteractorOutputProtocol = ArticleListPresenter()
            let interactor: ArticleListInteractorInputProtocol = ArticleListInteractor()
            let router: ArticleListRouterProtocol = ArticleListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    func presentArticleDetailScreen(from view: ArticleListViewProtocol, forArticle article: Article) {
        let postDetailViewController = ArticleDetailsRouter.createArticleDetailsModule(article: article)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        }
    }
    
    func presentSortOptions(inView view:ArticleListViewProtocol, sortCompletion: ((ArticlesSortType) -> ())?) {
        
        let alert = UIAlertController(
            title: "Sort By",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        
        for action in ArticlesSortType.allValues {
            alert.addAction(UIAlertAction(
                title: action.rawValue,
                style: .default,
                handler: { (alert: UIAlertAction!) in sortCompletion?(action) }
            ))
        }
        
        if let sourceView = view as? UIViewController {
            sourceView.present(alert, animated: true, completion: nil)
        }
    }
    
}
