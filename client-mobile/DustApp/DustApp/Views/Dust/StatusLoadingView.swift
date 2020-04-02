//
//  StatusLoadingView.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class StatusLoadingView: UIView {

    let activityIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.color = UIColor(named: "systemBlack")
        return indicatorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func dismissFromStatusView() {
        removeFromSuperview()
        activityIndicatorView.stopAnimating()
    }
    
    private func configure() {
        backgroundColor = UIColor(named: "systemWhite")
        addSubview(activityIndicatorView)
        activityIndicatorView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicatorView.startAnimating()
    }
}
