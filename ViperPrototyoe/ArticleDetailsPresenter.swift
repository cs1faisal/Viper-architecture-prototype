//
//  ArticleDetailsPresenter.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation

class ArticleDetailsPresenter: ArticleDetailsPresenterProtocol {
    var router: ArticleDetailsRouterProtocol?
    
    var view: ArticleDetailsViewProtocol?
    
    var article: Article?
    
    func viewDidLoad() {
        if let article = article {
            let date = DateFormatter()
            date.dateFormat = "dd/M/yyyy"
            let articleDetailModel = ArticleDetailsViewModel(imageViewURL: URL(string:article.image_url)!, imageTitle: article.title, imageSubTitle: date.string(from: article.date), bigTitle: article.title, content: article.content)
            view?.displayData(with: articleDetailModel)
        }
    }
}
