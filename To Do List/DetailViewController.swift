//
//  DetailViewController.swift
//  To Do List
//
//  Created by Paige Moshier on 9/23/19.
//  Copyright © 2019 Paige Moshier. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    @IBOutlet weak var toDoNoteView: UITextView!
    
    
    var toDoItem: String?
    var toDoNoteItem: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            if let toDoNoteItem = toDoNoteItem {
                toDoNoteView.text = toDoNoteItem
            }
        
        }
            toDoField.becomeFirstResponder()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
        }
    }
    
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        if toDoField.text!.count > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
    let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
}
