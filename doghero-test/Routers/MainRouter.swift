//
//  MainRouter.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)

class MainRouter: UINavigationController {

    var window: UIWindow?
    
    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
        setStyle()
    }
    
    private func setStyle() {
        let color = [NSAttributedStringKey.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.66)]
        navigationBar.titleTextAttributes = color
        navigationBar.largeTitleTextAttributes = color
    }
    
    func loadRootController() {
        viewControllers = [loadMyHeroesController()]
        if let window = window { window.rootViewController = self }
    }
    
}

extension MainRouter {
    fileprivate func loadMyHeroesController() -> UIViewController {
        
        let controller = mainStoryBoard.instantiateViewController(withIdentifier: "GridViewController") as! GridViewController
        let presenter = MyheroesPresenter()
        controller.presenter = presenter
        presenter.viewProtocol = controller
        
        return controller
    }
}
