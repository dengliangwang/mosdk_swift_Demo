//
//  ProductTableViewCell.swift
//  mosdkDemo
//
//  Created by dengliang.wang on 2018/6/28.
//  Copyright © 2018年 morlia. All rights reserved.
//

import UIKit
import MOSDK

class ProductTableViewCell: UITableViewCell {
    
    var  product:MOProduct?
    

    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buyProduct(_ sender: UIButton) {
        
        
        var param = [String:String]()
        
         param.updateValue("101", forKey: "server")
         param.updateValue("120", forKey: "role")
         param.updateValue("101", forKey: "extra1")
         param.updateValue("101", forKey: "extra2")
        
        
        
        MO.instance().buy(product!, params: param)
    }
}
