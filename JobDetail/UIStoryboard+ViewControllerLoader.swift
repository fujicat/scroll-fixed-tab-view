//
//  UIStoryboard+ViewControllerLoader.swift
//  TabInTab
//
//  Created by 片桐孝昌 on 2019/02/27.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func loadViewController(name: String) -> UIViewController {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}
