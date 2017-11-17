//
//  ViewController.swift
//  noteapp
//
//  Created by Ade Wija Nugraha on 8/11/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var postData = [String]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set the Database Reference
        ref = Database.database().reference()
        
        //Retrive the post and listen for changes
        databaseHandle = ref?.child("Notes").observe(.childAdded, with: { (snapshot) in
            //try to convert the value of the data to a string
            
            let post = snapshot.value as? String
            
            if let actualPost = post {
                
                //Append the data to the postData Array
                self.postData.append(actualPost)
                
                //reload the table view
                self.tableView.reloadData()
                
            }
            
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }


}

