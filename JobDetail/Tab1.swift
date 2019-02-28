//
//  Tab1.swift
//  JobDetail
//
//  Created by 片桐孝昌 on 2019/02/28.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

class Tab1: UIViewController {
    var header: Header1?
    var tabChangedHandler: TabChangedHandler! {
        didSet {
            header?.tabChangedHandler = tabChangedHandler
        }
    }

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let header = UINib.loadView(name: "Header1", owner: self) as? Header1 {
            scrollView.addSubview(header)
            header.initFrame(width: view.frame.width)

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
        }
    }
}
