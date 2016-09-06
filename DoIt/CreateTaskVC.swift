//
//  CreateTaskVC.swift
//  DoIt
//
//  Created by Mago Nicolas Palacios on 9/6/16.
//  Copyright © 2016 Mago Nicolas Palacios. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addTapped(_ sender: AnyObject)
    {
        let task = Task()
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        navigationController!.popViewController(animated: true)
    }


}
