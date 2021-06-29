//
//  ToDoTableViewCell.swift
//  GuidedToDoList
//
//

import UIKit


@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {
    var delegate: ToDoCellDelegate?
    @IBOutlet weak var selected_btn: UIButton!
    
    @IBOutlet weak var label_text: UILabel!
    
    @IBAction func selectedPressed(_ sender: Any) {
        delegate?.checkmarkTapped(sender: self)
    }
}
