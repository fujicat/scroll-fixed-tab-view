//
//  Tab1.swift
//  JobDetail
//
//  Created by 片桐孝昌 on 2019/02/28.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

class Tab1: UIViewController {
    var header: Header?
    var tabChangedHandler: TabChangedHandler! {
        didSet {
            header?.tabChangedHandler = tabChangedHandler
        }
    }

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let header = UINib.loadView(name: "Header1", owner: self) as? Header {
            scrollView.addSubview(header)
            header.initialize(width: view.frame.width, buttonIndex: 1)

            scrollView.contentInset.top = header.viewHeight
            scrollView.contentOffset.y = header.viewHeight * -1
            self.header = header
        }

        scrollView.delegate = self
    }
}

extension Tab1: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let header = self.header {
            header.updateHeight(offset: scrollView.contentOffset.y, inset: scrollView.contentInset.top)
            tabChangedHandler?.adjustScrollOffset(offset: header.contentOffset, from: self)
        }
    }
}
