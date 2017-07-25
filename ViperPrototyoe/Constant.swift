//
//  Constant.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/25/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation


enum ArticlesSortType:String {
    case date       = "Date"
    case title      = "Title"
    case author     = "Author"
    case website    = "Website"
    case none       = "Cancel"
    static let allValues = [date,title,author,website,none]
}

struct constantIdenfirs {
    static let mainStoryboard = "Main"
    static let articlesNavigationController =  "ArticlesNavigationController"
    
}

