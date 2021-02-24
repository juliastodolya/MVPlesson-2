//
//  MainPresenter.swift
//  MVPlesson
//
//  Created by Юлия on 22.02.2021.
//

import Foundation

//отправляет сообщения вьюхе (output)
protocol MainViewProtocol: class {
    func success()
    func failure(error: Error)
}

// input
protocol MainViewPresenterProtocol: class {
    //инициализатор, который будет захватывать ссылку на вью
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    //будет запрашивать комменты из сети
    func getComments()
    //будут сохраняться пришедшие комменты
    var comments: [Comment]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    var comments: [Comment]?
    //абстрактное вью, которое подписано под протокол
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    //бизнес-логика (чтобы на экране отображалось что-то)
   
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
