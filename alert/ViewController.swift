//
//  ViewController.swift
//  alert
//
//  Created by iMac on 08/08/2019.
//  Copyright © 2019 yuosaf01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func myButton_Show_DarkAlert(_ sender: UIButton) {
      
        MyAlert.view(Show: true)
        //or
        //MyAlert.view(Show: true,status: .dark)

        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.hide), userInfo: nil, repeats: false)

    }
    
    @IBAction func myButton_Show_LightAlert(_ sender: UIButton) {

        MyAlert.view(Show: true,status: .light)

        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.hide), userInfo: nil, repeats: false)

    }
    
    @objc func hide(){
      
        MyAlert.view(Show: false)
    }

}

