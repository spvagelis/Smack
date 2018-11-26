//
//  ChannelVC.swift
//  Smack
//
//  Created by vagelis spirou on 26/11/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }

}
