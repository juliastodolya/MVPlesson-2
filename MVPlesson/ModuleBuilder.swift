//
//  ModuleBuilder.swift
//  MVPlesson
//
//  Created by Юлия on 22.02.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

// проставляет зависимости и возвращает контроллер со вставленными зависимостями (injection)
class ModuleBuilder: Builder {
   
    
    static func createMainModule() -> UIViewController {
        //модель теперь не нужна
        //let model = Person(firstName: "David", lastName: "Blain")
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        
        //передаем презентер во вью (там мы его только объявили с типом протокола)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
