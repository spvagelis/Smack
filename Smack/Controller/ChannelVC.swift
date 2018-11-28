//
//  ChannelVC.swift
//  Smack
//
//  Created by vagelis spirou on 26/11/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }

}
