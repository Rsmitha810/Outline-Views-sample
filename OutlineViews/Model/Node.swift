//
//  Node.swift
//  OutlineViews
//
//  Created by Smitha Ramamurthy on 27/03/18.
//  Copyright © 2018 Smitha Ramamurthy. All rights reserved.
//

import Cocoa

class Node: NSObject {
    var name: String
    lazy var children = [Node]()
    var isLeaf: Bool {
        return children.isEmpty
    }
    
    override init() {
        self.name = ""
        super.init()
    }
    
    init(name: String) {
        self.name = name
    }
    
    func add(child: Node) {
        self.children.append(child)
    }
}

class Professor: Node {
    var empID: String
    var phoneNumber: String
    
    override init() {
        self.empID = ""
        self.phoneNumber = ""
        super.init()
    }
    
    init(name: String, empID: String, phoneNumber: String) {
        self.empID = empID
        self.phoneNumber = phoneNumber
        super.init(name: name)
    }
}
