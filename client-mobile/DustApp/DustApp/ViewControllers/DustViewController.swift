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
    
    @IBOutlet weak var gradeImageView: UIImageView!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var densityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stationLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let dustInfoListDelegate = DustInfoListDelegate()
    let dustInfoListDatasource = DustInfoListDataSource()
    
    let locationManager = LocationManager()
    let locationManagerDelegate = LocationManagerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStatusView()
        configureTableView()
        configureLocation()
    }
    
    private func configureLocation() {
        locationManager.delegate = locationManagerDelegate
        locationManager.requestLocation()
        locationManagerDelegate.didUpdateLocation = { location, error in
            if error != nil {
                self.locationManager.requestLocation()
                return
            }
        }
    }
    
    private func configureTableView() {
        tableView.delegate = dustInfoListDelegate
        tableView.dataSource = dustInfoListDatasource
        configureDustInfoListDelegateScrollHandler()
    }
    
    private func configureDustInfoListDelegateScrollHandler() {
        dustInfoListDelegate.didScroll = {
            guard let index = self.tableView.indexPathsForVisibleRows?.first?.item else { return }
        }
    }
    
    private func configureStatusView() {
        statusView.imageView = gradeImageView
        statusView.gradeLabel = gradeLabel
        statusView.densityLabel = densityLabel
        statusView.timeLabel = timeLabel
        statusView.stationLabel = stationLabel
    }
}
