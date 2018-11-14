//
//  FirstViewController.swift
//  RememberMe
//
//  Created by Tony Jiang on 11/5/18.
//  Copyright © 2018 Tony Jiang. All rights reserved.
//

import UIKit
import Disk

class MyPeopleVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myPeople: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        registerDefaults()
        setupTableView()
    }
    
    // HELPER FUNCTIONS
    func registerDefaults() {
        if let data = try? Disk.retrieve("myPeople.json", from: .documents, as: [Person].self) {
            myPeople = data
        }
        else {
            try? Disk.save(myPeople, to: .documents, as: "myPeople.json")
        }
    }
    
    // IBACTION
    
    
    // TABLEVIEW SETUP
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! PeopleCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPersonInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PersonInfoVC {
            destination.myPeople = myPeople
            destination.selectedIndexPath = tableView.indexPathForSelectedRow
            destination.person = myPeople[tableView.indexPathForSelectedRow!.row]
        }
    }


}

