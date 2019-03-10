//
//  ViewController.swift
//  Runner
//
//  Created by Bolo on 10/03/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class ViewControlle: UIViewController {
    
    fileprivate let scheme = "uppsmart"
    
    /**
     * 00 正式环境
     * 01 测试环境
     */
    fileprivate let mode = "01"
    
    func startPay(tn: String) -> Void {
        UPPaymentControl.default().startPay(tn, fromScheme: self.scheme, mode: self.mode, viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController did load")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
