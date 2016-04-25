//
//  MannerTableViewController.swift
//  Manners
//
//  Created by Chase Swanstrom on 4/17/16.
//  Copyright © 2016 Chase Swanstrom. All rights reserved.
//

import UIKit
import MessageUI

class MannerTableViewController: UITableViewController {

    var manners = [Manner]()
    let s = Settings()
    var set : Bool = false;
    var completedManners : String = ""
    
    @IBOutlet weak var emailButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //clear defaults for testing
        let appDomain = NSBundle.mainBundle().bundleIdentifier!
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
        
        loadManners()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //if email is set, display button
        if(s.defaults.objectForKey("email") != nil) {
            emailButton.enabled = true
            
        } else {
            emailButton.enabled = false
        }
    }
    
    @IBAction func sendEmail(sender: AnyObject) {
        
        let mail = MFMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            mail.setToRecipients([s.defaults.stringForKey("email")!])
            mail.setMessageBody("<p>I have viewed \(completedManners)</p>", isHTML: true)
            mail.setSubject("Progress")
            presentViewController(mail, animated: true, completion: nil)
            
        } else {
            // show failure alert
        }
        
    }


func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
    controller.dismissViewControllerAnimated(true, completion: nil)
    
    }

    func loadManners() {
        
        let manner1 = Manner(name: "Please", description: "When asking for something, say Please.", pic: "please")
        let manner2 = Manner(name: "Thank You", description: " When receiving something, say Thank you. Be especially appreciative and say thank you for any gift you receive.", pic: "thankyou")
        let manner3 = Manner(name: "Excuse Me", description: " If you bump into somebody, immediately say Excuse Me", pic: "excuseme")
        let manner4 = Manner(name: "Knocking", description: "Knock on closed doors -- and wait to see if there's a response -- before entering.", pic: "knocking")
        let manner5 = Manner(name: "Inside Voice", description: " Use a quiet voice inside, especially in places like restaurants.", pic: "insidevoice")
        let manner6 = Manner(name: "Covering Your Mouth", description: " Use a quiet voice inside, especially in places like restaurants.", pic: "coveringmouth")
        let manner7 = Manner(name: "Chewing", description: "Chew with your mouth closed.", pic: "chewing")
        let manner8 = Manner(name: "Sorry", description: "If you hurt someone, say I'm sorry and try to find a way to make it better.", pic: "sorry")
        
        
        manners += [manner1, manner2, manner3, manner4, manner5, manner6, manner7, manner8]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return manners.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MannerTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MannerTableViewCell
        
        let manner = manners[indexPath.row]
        cell.mannerLabel.text = manner.name
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.accessoryType = .Checkmark

        let manner = manners[indexPath.row]
        completedManners = completedManners + "- \(manner.name)  "
        print(completedManners)
        
    }


    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "settings" {
            segue.destinationViewController as! Settings
            
        } else {
            let mannerDetail = segue.destinationViewController as! ViewController
            if let selectedMannerCell = sender as? MannerTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMannerCell)!
                let selectedManner = manners[indexPath.row]
                mannerDetail.manner = selectedManner
                
            }
        }
    }

}
