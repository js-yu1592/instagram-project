//
//  IGFeedPostHeaderTableViewCell.swift
//  InstagramApp
//
//  Created by 유준상 on 2021/03/27.
//

import Foundation
import UIKit

class IGFeedPostHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostHeaderTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure the cell
        

    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
