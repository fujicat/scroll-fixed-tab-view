//
//  UINib+ViewLoader.swift
//  JobDetail
//
//  Created by 片桐孝昌 on 2019/02/28.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

extension UINib {
    class func loadView(name: String, owner: Any, index: Int = 0) -> UIView? {
        let nib = UINib(nibName: name, bundle: nil)
        return nib.instantiate(withOwner: owner, options: nil)[index] as? UIView
    }
}
