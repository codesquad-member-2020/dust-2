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
    let viewModel = DustStatusViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStatusViewElements()
        configureTableView()
        configureViewModelObserver()
        configureLocation()
        
        locationManager.requestLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reanimateTableView()
    }
    
    private func reanimateTableView() {
        for cell in tableView.visibleCells {
            guard let cell = cell as? DustInfoCell else { return }
            cell.initializeAnimation()
        }
    }
    
    private func configureLocation() {
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.didUpdateLocation = { location, error in
            if error != nil {
                self.locationManager.requestLocation()
                return
            }
            guard let location = location else { return }
            self.requestStationData(with: location)
        }
    }
    
    private func configureViewModelObserver() {
        viewModel.dustDataRequestObserver = {
            self.tableView.reloadData()
            self.statusView.updateStationLabel(with: self.viewModel.stationName)
            self.updateStatusViewWithTopCell()
        }
    }
    
    private func requestStationData(with location: Location) {
        DustNetworkManager.shared.requestStationData(with: location) { (station, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let station = station else { return }
            self.viewModel.station = station
        }
    }
    
    private func configureTableView() {
        tableView.delegate = dustInfoListDelegate
        tableView.dataSource = dustInfoListDatasource
        configureDatasourceViewModel()
        configureDustInfoListDelegateScrollHandler()
    }
    
    private func configureDatasourceViewModel() {
        dustInfoListDatasource.viewModel = viewModel
    }
    
    private func configureDustInfoListDelegateScrollHandler() {
        dustInfoListDelegate.didScroll = {
            self.updateStatusViewWithTopCell()
        }
    }
    
    private func updateStatusViewWithTopCell() {
        guard let index = self.tableView.indexPathsForVisibleRows?.first?.item else { return }
        let dustInfo = self.viewModel.dustInfo(at: index)
        self.statusView.updateDustInfo(with: dustInfo, at: index)
    }
    
    private func configureStatusViewElements() {
        statusView.imageView = gradeImageView
        statusView.gradeLabel = gradeLabel
        statusView.densityLabel = densityLabel
        statusView.timeLabel = timeLabel
        statusView.stationLabel = stationLabel
    }
}
