//
//  ViewController.swift
//  mosdkDemo
//
//  Created by dengliang.wang on 2018/6/27.
//  Copyright © 2018年 morlia. All rights reserved.
//

import UIKit
import MOSDK

class ViewController: UIViewController,MODelegate {

    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var buildLabel: UILabel!
    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var requestProductBtn: UIButton!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var faqBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        let version = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
        let build = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        
        versionLabel.text = version
        buildLabel.text = build
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func Login(_ sender: UIButton) {
        
        MO.instance().login(with: self, vc: self)
        
    }
    @IBAction func Logout(_ sender: UIButton) {
        MO.instance().logout()
        
    }
    
    @IBAction func showFacebook(_ sender: UIButton) {
        MO.instance().showSnsView(self)
    }
    
    @IBAction func showFAQ(_ sender: UIButton) {
        MO.instance().showFAQs(self)
    }
    
    //MARK --MODelegate
    
    func loginSuccess(_ aUser: MOUser!) {
        
        var playInfor = [String:String]()
        playInfor.updateValue("1", forKey: "server")
        playInfor.updateValue("10", forKey: "role")
        playInfor.updateValue("Game Extra Info", forKey: "extra")
        
        MO.instance().submitPlayerInfo(playInfor)
        
        
        self.logInBtn.isEnabled = false
        self.logoutBtn.isEnabled = true
        self.fbBtn.isEnabled = true
        self.requestProductBtn.isEnabled = true
        self.faqBtn.isEnabled = true
        
    }
    
    func loginFailed(_ aError: MOError!) {
        
    }
    
    func loginCancelled() {
        
    }
    
    func logoutDidFinish() {
        
        self.logInBtn.isEnabled = true
        self.logoutBtn.isEnabled = false
        self.fbBtn.isEnabled = false
        self.requestProductBtn.isEnabled = false
        self.faqBtn.isEnabled = false
        
    }
}

