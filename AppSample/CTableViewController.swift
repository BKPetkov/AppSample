//
//  CTableViewController.swift
//  AppSample
//
//  Created by Brian on 5/19/17.
//  Copyright © 2017 Brian. All rights reserved.
//

import UIKit

class CTableViewController: UITableViewController {
    
    //MARK: - Properties
    var contractors = [Contractor]()
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("debugging statement")
        
        contractors = [
            Contractor(category:"Carpenter", name:"John Smith"),
            Contractor(category:"Plumber", name:"Rand Name"),
            Contractor(category:"Painter", name:"Jane Doe "),
            Contractor(category:"Carpenter", name:"John Doe"),
            Contractor(category:"Electrician", name:"Alice Doe"),
            Contractor(category:"Landscaper", name:"J.R. User"),
            
        ]
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }

    // MARK: - Table view data

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 6
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
     
     let contractor = contractors[indexPath.row]
     cell.textLabel!.text = contractor.name
     cell.detailTextLabel!.text = contractor.category
     return cell
    }
    

  
}
