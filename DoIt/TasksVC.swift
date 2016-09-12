//
//  TasksVC.swift
//  DoIt
//
//  Created by Mago Nicolas Palacios on 9/6/16.
//  Copyright © 2016 Mago Nicolas Palacios. All rights reserved.
//

import UIKit

class TasksVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if !task.important {
            cell.textLabel?.text = task.name
        } else {
            cell.textLabel?.text = "\(task.name) ❗️"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Learn iOs"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Master iOs"
        task2.important = true

        
        let task3 = Task()
        task3.name = "Teach iOs"
        task3.important = true
        
        return [task1, task2, task3]

    }


    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskVC
            nextVC.previousVC = self
        } else if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskVC
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
        
    }


}

