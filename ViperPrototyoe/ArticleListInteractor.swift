//
//  ArticleListInteractor.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation

class ArticleListInteractor: ArticleListInteractorInputProtocol {
    var presenter: ArticleListInteractorOutputProtocol?
    
    func retrieveArticleList() {
        NetworkManager.getArticles(successBlocks: { (articles) in
            self.presenter?.didRetrieveArticles(articles)
        }) { (error) in
            self.presenter?.onError(error: error)
        }
    }
}
