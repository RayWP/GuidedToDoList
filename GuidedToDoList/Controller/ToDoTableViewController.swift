//
//  ToDoTableViewController.swift
//  GuidedToDoList
//
//  Created by Raymond on 28/06/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var todo : ToDo?
    
    @IBOutlet weak var save_btn: UIBarButtonItem!
    @IBOutlet weak var selected_btn: UIButton!
    @IBOutlet weak var title_text: UITextField!
    @IBOutlet weak var date_picker: UIDatePicker!
    @IBOutlet weak var due_date_text: UILabel!
    @IBOutlet weak var notes_text: UITextView!
    var is_picker_hidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            navigationItem.title = "To-Do"
            title_text.text = todo.title
            selected_btn.isSelected = todo.isComplete
            date_picker.date = todo.dueDate
            notes_text.text = todo.notes
        } else {
            date_picker.date = Date().addingTimeInterval(24*60*60)
        }
        
        updateSaveButtonState()
        updateDueDateLabel(date: date_picker.date)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateDueDateLabel(date: Date) {
        due_date_text.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        updateDueDateLabel(date: date_picker.date)
    }
    @IBAction func text_changed(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func isCompletedTapped(_ sender: Any) {
        selected_btn.isSelected = !selected_btn.isSelected
    }
    @IBAction func returnPressed(_ sender: Any) {
        title_text.resignFirstResponder()
    }
    func updateSaveButtonState() {
        let text = title_text.text ?? ""
        save_btn.isEnabled = !text.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = title_text.text!
        let isComplete = selected_btn.isSelected
        let dueDate = date_picker.date
        let notes = notes_text.text
        
        todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(100)
        let largeCellHeight = CGFloat(200)

        switch(indexPath) {
            case [1,0]: //Due Date Cell
                return is_picker_hidden ? normalCellHeight : largeCellHeight
            case [2,0]: //Notes Cell
                return largeCellHeight
            default: return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
            case [2,0]:
                is_picker_hidden = !is_picker_hidden
                
                due_date_text.textColor =
                is_picker_hidden ? .black : tableView.tintColor
                tableView.beginUpdates()
                tableView.endUpdates()
            default: break
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
