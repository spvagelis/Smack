//
//  CreateAccountVC.swift
//  Smack
//
//  Created by vagelis spirou on 28/11/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
