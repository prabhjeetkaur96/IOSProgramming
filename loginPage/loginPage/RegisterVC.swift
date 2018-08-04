//
//  RegisterVC.swift
//  loginPage
//
//  Created by MacStudent on 2018-08-04.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblPassword: UILabel!
    
    @IBOutlet weak var lblDOB: UILabel!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    
    @IBOutlet weak var SagmentGender: UISegmentedControl!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var pickDOB: UIDatePicker!
    
    @IBOutlet weak var segNormal: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnRegister(_ sender: Any) {
        
    }
    
    @IBAction func normalClick(_ sender: Any) {
        let sgmntBtn1 = sender as! UISegmentedControl
        print("select segment : \(sgmntBtn1.selectedSegmentIndex)")
    }
    @IBAction func txtGender(_ sender: Any) {
        let sgmntBtn = sender as! UISegmentedControl
        
//        switch sgmntBtn.selectedSegmentIndex {
//        case 1:
//            print("First is selected")
//        case 2:
//            print("Second is selected")
//        default:
//            <#code#>
//        }
//
//        if sgmntBtn.selectedSegmentIndex == 1{
//
//        }else if sgmntBtn.selectedSegmentIndex == 2{
//
//        }
   }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
