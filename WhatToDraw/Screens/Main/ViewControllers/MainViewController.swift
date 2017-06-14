//
//  MainViewController.swift
//  MvvmStarterSwiftProject
//
//  Created by Ozgun Zor on 27/05/2017.
//  Copyright © 2017 Ozgun Zor. All rights reserved.
//

import RxSwift
import RxCocoa
import Moya
import UIKit

class MainViewController: WTDViewController {

    var location: Variable<LocationModel>!
    var viewModel = Variable<MainViewModel>(
    
    let provider = RxMoyaProvider<Mocky>()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViewModel()
        self.prepareUI()
    }
    
    // MARK: - Helper Methods
    
    func prepareViewModel() {
        
        
        self.viewModel.value.location.asObservable().subscribe(onNext: { (location) in
            self.tableView.reloadData()
        })
    }
    
    func prepareRx() {
        
    }
    
    func prepareUI() {
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "")
        
        cell?.textLabel?.text = String(self.location.value.latitude)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
