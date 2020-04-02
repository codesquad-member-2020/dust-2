//
//  DustInfoListDelegate.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/30.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DustInfoListDelegate: NSObject, UITableViewDelegate {
    
    private let cellHeight: CGFloat = 36
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
