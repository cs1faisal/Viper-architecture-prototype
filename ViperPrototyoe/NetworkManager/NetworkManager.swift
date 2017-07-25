//
//  NetworkManager.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/23/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import Foundation
import Alamofire
class NetworkManager {
    static func getArticles(successBlocks: @escaping ([Article]) -> Void,failureBlock failureBlocks:@escaping (Error) -> Void) {
        Alamofire.request("https://www.ckl.io/challenge/").responseJSON { (response) in
            if let error = response.error {
                failureBlocks(error)
            }
                if (response.response?.statusCode == 200) {
                    if let json = response.data  {
                        do {
                            let decoder = JSONDecoder()
                            let formatter = DateFormatter()
                            formatter.dateFormat = "MM/dd/yyyy"
                            decoder.dateDecodingStrategy = .formatted(formatter)
                            let articles = try decoder.decode([Article].self, from: json)
                            successBlocks(articles)
                        }
                        catch {
                            
                        }
                    }
                }
        }
    }
}
