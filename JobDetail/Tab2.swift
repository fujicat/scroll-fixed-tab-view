//
//  Tab2.swift
//  JobDetail
//
//  Created by 片桐孝昌 on 2019/02/28.
//  Copyright © 2019 片桐孝昌. All rights reserved.
//

import UIKit

class Tab2: UITableViewController {
    var header: Header?
    var tabChangedHandler: TabChangedHandler! {
        didSet {
            header?.tabChangedHandler = tabChangedHandler
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let header = UINib.loadView(name: "Header2", owner: self) as? Header {
            tableView.addSubview(header)
            header.initialize(width: view.frame.width, buttonIndex: 0)

            tableView.contentInset.top = header.viewHeight
            tableView.contentOffset.y = header.viewHeight * -1
            self.header = header
        }

        initCell()
    }

    func initCell() {
        let cell = UINib(nibName: "Cell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.setup(prefix: "tab2", indexPath: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let header = self.header {
            header.updateHeight(offset: scrollView.contentOffset.y, inset: scrollView.contentInset.top)
            tabChangedHandler?.adjustScrollOffset(offset: header.contentOffset, from: self)
        }
    }
}
