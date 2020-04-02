//
//  DustInfoListDataSource.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/30.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DustInfoListDataSource: NSObject, UITableViewDataSource {
    
    weak var viewModel: DustStatusViewModel?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dustInfosCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DustInfoCell.identifier, for: indexPath) as! DustInfoCell
        if let dustInfo = viewModel?.dustInfo(at: indexPath.item) {
            cell.updateCell(with: dustInfo)
        }
        return cell
    }
}
