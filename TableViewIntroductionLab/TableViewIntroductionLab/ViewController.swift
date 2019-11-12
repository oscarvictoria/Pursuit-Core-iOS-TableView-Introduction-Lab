//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var task = Task.allTasks { // empty array
           
           didSet {
               tableView.reloadData()
           }
           
           
       }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        let tasks = task[indexPath.row]
        
        cell.textLabel?.text = tasks.name
        cell.detailTextLabel?.text = tasks.dueDate.description
        
        return cell 
    }
}
