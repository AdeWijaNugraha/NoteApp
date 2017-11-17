//
//  ComposeViewController.swift
//  noteapp
//
//  Created by Ade Wija Nugraha on 8/11/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPost(_ sender: Any) {
        //Add some Post to Firebase
        ref.child("Notes").childByAutoId().setValue(textView.text)
        
        // Dismis the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        // Cancel the post
        // Dismis the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
