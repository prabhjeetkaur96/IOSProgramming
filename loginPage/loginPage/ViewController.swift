//
//  ViewController.swift
//  loginPage
//
//  Created by MacStudent on 2018-08-04.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBOutlet weak var lblPass: UILabel!
    
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtPass: UITextField!
    
    
    @IBOutlet weak var buttonReg: UIButton!
  
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    @IBOutlet weak var send: UISegmentedControl!
    @IBOutlet weak var first: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    
    @IBAction func clickEvent(_ sender: Any) {
        
    }
    
    @IBAction func btnsave(_ sender: Any) {
        let clickButton = sender as! UIButton
        if clickButton.tag == 1{
          buttonReg.isHidden = false
          buttonLogin.isHidden = true
        }
        else if clickButton.tag == 2{
            buttonReg.isHidden = true
            buttonLogin.isHidden = false
        }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

