//
//  Cell.swift
//  JobDetail
//
//  Created by 片桐孝昌 on 2019/02/28.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    func setup(prefix: String, indexPath: IndexPath) {
        label.text = prefix + "-" + indexPath.row.description
    }
}
