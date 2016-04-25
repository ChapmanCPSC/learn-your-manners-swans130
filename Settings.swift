//
//  Settings.swift
//  Manners
//
//  Created by Chase Swanstrom on 4/24/16.
//  Copyright © 2016 Chase Swanstrom. All rights reserved.
//

import UIKit

class Settings: UIViewController {

    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
       
        defaults.setObject(emailTextField.text!, forKey: "email")
        let m = MannerTableViewController()
        m.set = true
        navigationController!.popViewControllerAnimated(true)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
