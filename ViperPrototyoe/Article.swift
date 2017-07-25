//
//  Article.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/23/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation

struct Article: Decodable {
    var date : Date
    var title : String
    var website : String
    var authors : String
    var content : String
    var image_url : String
}
