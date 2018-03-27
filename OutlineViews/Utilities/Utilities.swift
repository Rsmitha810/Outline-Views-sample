//
//  Utilities.swift
//  OutlineViews
//
//  Created by Smitha Ramamurthy on 27/03/18.
//  Copyright © 2018 Smitha Ramamurthy. All rights reserved.
//

import Cocoa

func sampleData() -> [Node] {
    let department1 = Node(name: "Science")
    let sbu1 = Node(name: "BU1")
    let sbu2 = Node(name: "BU2")
    department1.add(child: sbu1)
    department1.add(child: sbu2)
    let slecturer1 = Professor(name: "Mary Jones", empID: "Lec1", phoneNumber: "9900345682")
    let slecturer2 = Professor(name: "Kristen", empID: "Lec2", phoneNumber: "8902345678")
    let slecturer3 = Professor(name: "David", empID: "Lec3", phoneNumber: "8123467890")
    let slecturer4 = Professor(name: "Sarah", empID: "Lec4", phoneNumber: "8890345678")
    
    sbu1.add(child: slecturer1)
    sbu1.add(child: slecturer2)
    sbu2.add(child: slecturer3)
    sbu2.add(child: slecturer4)
    
    let department2 = Node(name: "Arts")
    let abu1 = Node(name: "BU1")
    let abu2 = Node(name: "BU2")
    department2.add(child: abu1)
    department2.add(child: abu2)
    let alecturer1 = Professor(name: "Graham", empID: "Lec1", phoneNumber: "9900345682")
    let alecturer2 = Professor(name: "Monica", empID: "Lec2", phoneNumber: "8902345678")
    let alecturer3 = Professor(name: "Ross", empID: "Lec3", phoneNumber: "8123467890")
    let alecturer4 = Professor(name: "Micheal", empID: "Lec4", phoneNumber: "8890345678")
    
    abu1.add(child: alecturer1)
    abu1.add(child: alecturer2)
    abu2.add(child: alecturer3)
    abu2.add(child: alecturer4)
    
    return [department1, department2]
}
