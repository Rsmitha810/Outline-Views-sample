//
//  OutlineViewController.swift
//  OutlineViews
//
//  Created by Smitha Ramamurthy on 27/03/18.
//  Copyright © 2018 Smitha Ramamurthy. All rights reserved.
//

import Cocoa

protocol OutlineViewDelegate: class {
    func outlineView(didSelect node: Node?)
}

class OutlineViewController: NSViewController {
    //MARK: - Variables
    private var departments : [Node] = []{
        didSet {
            outlineView.reloadData()
        }
    }
    weak var delegate: OutlineViewDelegate?
    
    //MARK: - IB Outlets
    @IBOutlet weak var outlineView: NSOutlineView!
    
    //MARK: - Life Cycle events
    override func viewDidLoad() {
        super.viewDidLoad()
        
        departments = sampleData()
        outlineView.expandItem(nil, expandChildren: true) //passing nil as argument makes the outline view expand all the root items
    }
}

//MARK: - Outline View Data Source methods
extension OutlineViewController: NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        guard let item = item as? Node else  { return departments.count }
        return item.children.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        guard let node = item as? Node else {
            return departments[index]
        }
        return node.children[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        guard let node = item as? Node else { return false }
        return !node.isLeaf
    }
    
    func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
        guard let node = item as? Node else { return nil }
        return node.name
    }
}

//MARK: - Outline View Delegate methods
extension OutlineViewController: NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: Constants.TableColumnIdentifiers.dataCell), owner: self) as? NSTableCellView
        guard let node = item as? Node else { return view }
        view?.textField?.stringValue = node.name
        return view
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let node = outlineView.item(atRow: outlineView.selectedRow) as? Node else {
            delegate?.outlineView(didSelect: nil)
            print(Constants.ErrorCodes.InvalidRowError)
            return
        }
        delegate?.outlineView(didSelect: node) //If node is a leaf node, it is a professor node, else pass nil
    }
}

