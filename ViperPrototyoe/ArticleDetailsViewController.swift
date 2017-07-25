//
//  ArticleDetailsViewController.swift
//  ViperPrototyoe
//
//  Created by Faisal Al-Othman on 7/24/17.
//  Copyright © 2017 Faisal Al-Othman. All rights reserved.
//

import UIKit
import SDWebImage

struct ArticleDetailsViewModel {
    let imageViewURL:URL
    let imageTitle:String
    let imageSubTitle:String
    let bigTitle:String
    let content:String
}
class ArticleDetailsViewController: UIViewController {
    
    var presenter: ArticleDetailsPresenterProtocol?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageSubTitle: UILabel!
    @IBOutlet weak var bigTitle: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension ArticleDetailsViewController : ArticleDetailsViewProtocol {
    func displayData(with data: ArticleDetailsViewModel) {
        self.imageView.sd_setImage(with: data.imageViewURL)
        self.imageTitle.text = data.imageTitle
        self.imageSubTitle.text = data.imageSubTitle
        self.bigTitle.text = data.bigTitle
        self.content.text = data.content
    }
}
