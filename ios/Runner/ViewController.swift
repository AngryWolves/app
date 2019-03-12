//
//  ViewController.swift
//  Runner
//
//  Created by Bolo on 10/03/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    init(tn: String) {
        super.init(nibName: nil, bundle: nil)
        self.tn = tn
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tn: String!
    
    fileprivate let scheme = "Runner"
    
    /**
     * 00 正式环境
     * 01 测试环境
     */
    fileprivate let mode = "01"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startPay(tn: self.tn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func startPay(tn: String) -> Void {
        UPPaymentControl.default().startPay(tn, fromScheme: self.scheme, mode: self.mode, viewController: self)
    }
}
