//
//  ViewController.swift
//  ssnField
//
//  Created by Sergey Sahakyan on 12/29/15.
//  Copyright © 2015 Sergey Sahakyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textFields: [UITextField]!
    
    let ssnFieldDelegate = SSNTextFieldDelegate()
    var delegates = [SSNTextFieldDelegate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields.forEach { (field) -> () in
            let delegate = SSNTextFieldDelegate()
            self.delegates.append(delegate)
            field.delegate = delegate
        }
    }
    
    @IBAction func validateFields(sender: AnyObject) {
        let validation = textFields.map({ ($0.delegate as? SSNTextFieldDelegate)?.getSSN()?.isValid() ?? false })
        print(validation)
        
        let msg = validation.map { $0.description }.joinWithSeparator(",")
        let alertVC = UIAlertController(title: nil, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertVC.addAction(okAction)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
}

