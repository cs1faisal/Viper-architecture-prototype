//
//  ArticleDetailsRouter.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailsRouter: ArticleDetailsRouterProtocol {
    static func createArticleDetailsModule(article: Article) -> UIViewController {
        let articleDetailsViewController:ArticleDetailsViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticleDetailsViewControllerID") as! ArticleDetailsViewController
        
        let presenter: ArticleDetailsPresenterProtocol = ArticleDetailsPresenter()
        let router: ArticleDetailsRouterProtocol = ArticleDetailsRouter()
        
        articleDetailsViewController.presenter = presenter
        presenter.view = articleDetailsViewController
        presenter.router = router
        presenter.article = article
        
        return articleDetailsViewController
    }
}
