//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by Md Shohidur Rahman on 5/8/23.
//

import UIKit


protocol TweetTableViewCellDelegate: AnyObject {
    func tweetTableViewCellDidTapReply()
    func tweetTableViewCellDidTapRetweet()
    func tweetTableViewCellDidTapLike()
    func tweetTableViewCellDidTapShare()
    
    
}




class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    
    weak var delegate: TweetTableViewCellDelegate?
    
    private let actionSpacing: CGFloat = 60
    
    private let avatarImageView: UIImageView = {
         
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .green
        return imageView
    }()
    
    
    private let displayNameLabel: UILabel = {
         
        let label = UILabel()
        label.text = "shahid"
        label.font = .systemFont(ofSize: 18,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "@msr"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize:16, weight:.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let tweetTextContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is test tweet"
        label.numberOfLines = 0
        return label
    }()
    
    
    private let replayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "share.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(replayButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureConstraints()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    private func configureButtons(){
        replayButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action:#selector(didTapShare), for: .touchUpInside)
    }
    
    @objc private func didTapReply(){
        
        delegate?.tweetTableViewCellDidTapReply()
        
    }
    
    @objc private func didTapRetweet(){
        
        delegate?.tweetTableViewCellDidTapRetweet()
        
    }
    
    @objc private func didTapLike(){
        delegate?.tweetTableViewCellDidTapLike()
    }
    
    @objc private func didTapShare(){
        
        delegate?.tweetTableViewCellDidTapShare()
        
    }
    
    private func configureConstraints(){
        
        let avatarImageViewConstraints = [
            
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
        ]
          
        
        let displayNameLabelConstraints = [
            
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            
        
            displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ]
        
        let usernameLabelConstraints = [
            
            userNameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            userNameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
        ]
        
        let tweetTextContentLabelConstraints = [
            
            tweetTextContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            tweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15),
            tweetTextContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor,constant: 10),
            tweetTextContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        
        let replayButtonConstraints = [
            replayButton.leadingAnchor.constraint(equalTo: tweetTextContentLabel.leadingAnchor),
            replayButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor,constant: 10),
            replayButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15)
            
        ]
        
        let retweetButtonConstraints = [
        
            retweetButton.leadingAnchor.constraint(equalTo: replayButton.trailingAnchor, constant: actionSpacing),
            retweetButton.centerYAnchor.constraint(equalTo: retweetButton.centerYAnchor)
            
        ]
        
        let likeButtonConstraints = [
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: actionSpacing),
            likeButton.centerYAnchor.constraint(equalTo: replayButton.centerYAnchor)
        ]
        
        let shareButtonConstraints = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
            shareButton.centerYAnchor.constraint(equalTo: replayButton.centerYAnchor)
        ]
        
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(tweetTextContentLabelConstraints)
        NSLayoutConstraint.activate(replayButtonConstraints)
        NSLayoutConstraint.activate(retweetButtonConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
            
        
    }
}