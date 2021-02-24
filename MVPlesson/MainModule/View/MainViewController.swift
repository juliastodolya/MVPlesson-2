//
//  ViewController.swift
//  MVPlesson
//
//  Created by Юлия on 21.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //связь с презентером, чтобы передавать ему сообщения (оповещать что тапнули или еще что-то) не создаем, а только объявляем, чтобы делать инъекцию зависимости, передавать снаружи
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //когда юзер нажал на кнопку, говорим презентеру - выполни бизнес логику - покажи приветствие на вью
    
}

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.body
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailVC = ModuleBuilder.createDetailModule(comment: comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
    
    //binding - связывание с вью, обновление данных через что-то
extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
