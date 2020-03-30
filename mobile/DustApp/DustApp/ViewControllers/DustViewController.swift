//
//  ViewController.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/29.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DustViewController: UIViewController {
    
    @IBOutlet weak var statusView: DustStatusView!
    
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var densityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var instrumentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusView()
    }
    
    private func setupStatusView() {
        statusView.gradeLabel = gradeLabel
        statusView.densityLabel = densityLabel
        statusView.timeLabel = timeLabel
        statusView.instrumentLabel = instrumentLabel
    }
}

