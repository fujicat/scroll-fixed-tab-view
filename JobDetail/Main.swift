//
//  Main.swift
//  JobDetail
//
//  Created by 片桐孝昌 on 2019/02/28.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

protocol TabChangedHandler {
    func onSelectTab(index: Int)
}

class Main: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabBar.isHidden = true
        let tab1 = UIStoryboard.loadViewController(name: "Tab1") as! Tab1
        let tab2 = UIStoryboard.loadViewController(name: "Tab2") as! Tab2
        viewControllers = [tab1, tab2]
        for vc in viewControllers! {
            _ = vc.view
        }
        tab1.tabChangedHandler = self
        tab2.tabChangedHandler = self
    }
}

extension Main: TabChangedHandler {
    func onSelectTab(index: Int) {
        self.selectedIndex = index
    }
}
