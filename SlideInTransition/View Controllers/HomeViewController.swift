//
//  HomeViewController.swift
//  SlideInTransition
//
//  Created by Aman Meena on 05/03/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // Outlets
    
    // Variables
    var topView:  UIView?
    
    // Constants
    let transition = SlideInTransition()
    
    // Actions
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        if let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController {
            menuViewController.didTapMenuType = { menuType in
                self.transitionToNew(menuType)
            }
            menuViewController.modalPresentationStyle = .overCurrentContext
            menuViewController.transitioningDelegate = self
            present(menuViewController, animated: true, completion: nil)
        } else { return }
        
    }
    
    // Functions
    func transitionToNew(_ menuType:  MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        
        topView?.removeFromSuperview()
        switch menuType {
        case .camera:
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .profile:
            let view = UIView()
            view.backgroundColor = .blue
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    


}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
