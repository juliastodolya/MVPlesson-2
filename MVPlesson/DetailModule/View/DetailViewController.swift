//
//  DetailViewController.swift
//  MVPlesson
//
//  Created by Юлия on 22.02.2021.
//

import UIKit



class DetailViewController:
    UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //когда загрузится сообщит презентеру, что пора начинать сэтить комменты
        presenter.startSetComment()
        
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
