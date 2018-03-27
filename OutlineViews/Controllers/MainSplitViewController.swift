//
//  MainSplitViewController.swift
//  OutlineViews
//
//  Created by Smitha Ramamurthy on 27/03/18.
//  Copyright © 2018 Smitha Ramamurthy. All rights reserved.
//

import Cocoa

class MainSplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let outlineVC = splitViewItems.first?.viewController as! OutlineViewController
        let displayVC = splitViewItems.last?.viewController as! DisplayViewController
        outlineVC.delegate = displayVC 
    }
    
}
