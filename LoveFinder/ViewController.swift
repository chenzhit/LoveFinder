//
//  ViewController.swift
//  LoveFinder
//
//  Created by 陈智 on 15/1/22.
//  Copyright (c) 2015年 chenzhit. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var heightNumber: UISlider!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var result: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func heightChanged(sender: AnyObject) {
        let slider = sender as UISlider
        
        height.text="\(Int(slider.value))厘米"
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex == 0 ? "高富帅" : "白富美"
        
        let gregorian = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = gregorian?.components(NSCalendarUnit.YearCalendarUnit, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))
        let age = components?.year
        
        let hasPropertyText = hasProperty.on ? "有房" : "没房"
        
        result.text = "\(name.text),\(age!)岁,身高\(height.text!),\(hasPropertyText),求交往！"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        name.resignFirstResponder()
        return true
    }
    
}

