//
//  CompleteTaskVC.swift
//  DoIt
//
//  Created by Mago Nicolas Palacios on 9/12/16.
//  Copyright © 2016 Mago Nicolas Palacios. All rights reserved.
//

import UIKit

class CompleteTaskVC: UIViewController {
    
    @IBOutlet weak var taskLbl: UILabel!
    
    var task = Task()
    
    var previousVC = TasksVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !task.important {
            taskLbl.text = task.name
        } else {
            taskLbl.text = "\(task.name) ❗️"
        }
        
        taskLbl.text = task.name
    }

    @IBAction func completeTapped(_ sender: AnyObject) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
