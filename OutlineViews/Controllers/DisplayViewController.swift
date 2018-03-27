//
//  DisplayViewController.swift
//  OutlineViews
//
//  Created by Smitha Ramamurthy on 27/03/18.
//  Copyright © 2018 Smitha Ramamurthy. All rights reserved.
//

import Cocoa

class DisplayViewController: NSViewController {
    @objc dynamic var profName: String?
    @objc dynamic var profID: String?
    @objc dynamic var profPhone: String?
    @IBOutlet weak var displayBox: NSBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayBox.isHidden = true
    }
}

//MARK: - OutlineViewDelegate methods
extension DisplayViewController: OutlineViewDelegate {
    func outlineView(didSelect node: Node?) {
        
        guard let node = node else { // check if valid node is sent or nil
            displayBox.isHidden = true
            return
        }
        
        switch node.isLeaf { //leaf node is a Professor node, check for that
        case true:
            let node = node as! Professor
            profName = node.name
            profID = node.empID
            profPhone = node.phoneNumber
            displayBox.isHidden = false
        case false:
            displayBox.isHidden = true
        }
    }
}
