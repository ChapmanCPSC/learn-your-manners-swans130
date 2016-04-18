//
//  ViewController.swift
//  Manners
//
//  Created by Chase Swanstrom on 4/17/16.
//  Copyright © 2016 Chase Swanstrom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manner : Manner!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mannerImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        self.nameLabel.text = manner.name
        self.descriptionLabel.text = manner.description
        self.mannerImage.image = UIImage(named: manner.pic)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func backPressed(sender: AnyObject) {
        
           self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}

