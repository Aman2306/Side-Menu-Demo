//
//  MenuViewController.swift
//  SlideInTransition
//
//  Created by Aman Meena on 05/03/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case profile
    case camera
}

class MenuViewController: UITableViewController {

    // Outlets
    @IBOutlet var menuTableView: UITableView!
    
    // Variables
    var didTapMenuType: ((MenuType) -> Void)?
    
    // Constants
    
    
    // Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callDelegates()
    }
    
    func callDelegates() {
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("dismissing \(menuType)" )
            self?.didTapMenuType?(menuType)
        }
    }
}
