//
//  AppTableViewCell.swift
//  AppStoreSearch
//
//  Created by Marcos Griselli on 14/07/2018.
//  Copyright © 2018 Marcos Griselli. All rights reserved.
//

import UIKit
import Kingfisher

class AppTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenshotStackView: UIStackView!
    var screenshotImageViews: [UIImageView] {
        return screenshotStackView.arrangedSubviews as! [UIImageView]
    }
    
    func configure(app: App) {
        nameLabel.text = app.name
        genreLabel.text = app.genre
        iconImageView.kf.setImage(with: URL(string: app.icon))
        for (index, screenshot) in app.screenshots.enumerated() {
            screenshotImageViews[safe: index]?.kf
                .setImage(with: URL(string: screenshot))
        }
    }
    
    func cancel() {
        iconImageView.kf.cancelDownloadTask()
        screenshotImageViews.forEach { $0.kf.cancelDownloadTask() }
    }
}
