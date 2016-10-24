//
//  ViewController.swift
//  jins_test
//
//  Created by 三木隆裕 on 2016/10/23.
//  Copyright © 2016年 tmtakahiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MEMELibDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MEMELib.sharedInstance().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func memeAppAuthorized(status: MEMEStatus) {
        MEMELib.sharedInstance().startScanningPeripherals()
    }
    
    func memePeripheralFound(peripheral: CBPeripheral!, withDeviceAddress address: String!) {
        MEMELib.sharedInstance().connect(peripheral)
    }
    
    func memePeripheralConnected(peripheral: CBPeripheral!) {
        let status = MEMELib.sharedInstance().startDataReport()
        print(status)
    }
    
    func memeRealTimeModeDataReceived(data: MEMERealTimeData!) {
        print(data.description)
    }


}

