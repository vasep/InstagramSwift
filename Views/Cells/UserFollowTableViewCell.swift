//
//  UserFollowTableViewCell.swift
//  Instagram
//
//  Created by Vasil Panov on 9.4.21.
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject {
    func didTapFollowUnfollowButton(model: String)
}

class UserFollowTableViewCell: UITableViewCell {
    static let identifier = "UserFollowTableViewCell"
    
    public weak var delegate: UserFollowTableViewCellDelegate?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .monospacedSystemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let usernamenameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .monospacedSystemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernamenameLabel)
        contentView.addSubview(followButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    public func configure(with model: String){
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernamenameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
