//
//  PersonsTableViewController.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/6/21.
//

import UIKit

class PersonsTableViewController: UIViewController {
    
    let tableView = UITableView()
    var personList: [Person] = []
    
    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        setupTableView()
        setUpNavigation()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "personCell")
        fetchData()
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    func setUpNavigation() {
        navigationItem.title = "Persons List"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
        self.navigationItem.rightBarButtonItem = createNavigationButton()
    }
    
    func createNavigationButton() -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: "icon_sort"), for: .normal)
        btn.setImage(UIImage(named: "icon_sort_highlighted"), for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.addTarget(self, action: #selector(fetchData), for: .touchUpInside)
        let item = UIBarButtonItem()
        item.customView = btn
        return item
    }
    @objc func fetchData() {
        showLoader()
        let apiRequest = APIRequest(networkSession: URLSession(configuration: .default))
        apiRequest.getData(from: UrlManager().personsPath()) { [weak self] (result: Result<[Person], NetworkError>) in
            guard let weakSelf = self else { return }
            weakSelf.hideLoader()
            switch result {
            case .success(let model):
                weakSelf.personList = model
                DispatchQueue.main.async {
                    weakSelf.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    private func showLoader() {
        DispatchQueue.main.async {
            Loader.shared.showLoader(view: self.tableView)
        }
    }
    private func hideLoader() {
        DispatchQueue.main.async {
            Loader.shared.hideLoader(from: self.tableView)
        }
    }
}

extension PersonsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
        cell.viewModel = personList[indexPath.row]
      return cell
    }
}

extension PersonsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
}
