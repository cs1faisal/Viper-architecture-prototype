//
//  ArticleDetailsProtocol.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation
import UIKit

//MARK: PRESENTER -> VIEW
protocol ArticleDetailsViewProtocol: class {
    var presenter: ArticleDetailsPresenterProtocol? { get set }
    func displayData(with data: ArticleDetailsViewModel)
}

//MARK: PRESENTER -> ROUTER
protocol ArticleDetailsRouterProtocol: class {
    static func createArticleDetailsModule(article: Article) -> UIViewController
}


//MARK: VIEW -> PRESENTER
protocol ArticleDetailsPresenterProtocol: class {
    var view: ArticleDetailsViewProtocol? { get set }
    var router: ArticleDetailsRouterProtocol? { get set }
    var article: Article? {get set}
    func viewDidLoad()
}
