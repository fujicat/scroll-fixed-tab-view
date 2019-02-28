//
//  Header.swift
//  JobDetail
//
//  Created by 片桐孝昌 on 2019/02/28.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

class Header: UIView {
    var tabChangedHandler: TabChangedHandler?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tab: UIStackView!

    var viewHeight: CGFloat!
    var buttonIndex: Int!
    var contentOffset: CGFloat = 0

    func initialize(width: CGFloat, buttonIndex: Int) {
        if let image = imageView.image {
            viewHeight = width * image.size.height / image.size.width + tab.frame.height
            self.frame = CGRect(x: 0, y: 0, width: width, height: viewHeight)
        }
        self.buttonIndex = buttonIndex
    }

    func updateHeight(offset: CGFloat, inset: CGFloat) {
        let tabHeight = tab.isHidden ? 0 : tab.frame.height
        var frame = self.frame
        frame.origin.y = offset - (inset + offset)
        contentOffset = offset
        if offset > tabHeight * -1 {
            frame.origin.y = inset * -1 + tabHeight + offset
            contentOffset = tabHeight * -1
        }
        self.frame = frame
    }

    @IBAction func onTap(_ sender: UIButton) {
        tabChangedHandler?.onSelectTab(index: buttonIndex)
    }
}
