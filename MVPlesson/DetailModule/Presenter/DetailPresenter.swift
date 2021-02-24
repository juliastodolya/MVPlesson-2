//
//  DetailPresenter.swift
//  MVPlesson
//
//  Created by Юлия on 22.02.2021.
//

import Foundation

//presenter message to view
protocol DetailViewProtocol: class {
   func setComment(comment: Comment?)
}

//чтобы вью обращалась к презентеру
protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    ///вью просит засетить коммент (setComment в примере)
    func startSetComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    var comment: Comment?
    //абстрактное вью, которое подписано под протокол
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    public func startSetComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
