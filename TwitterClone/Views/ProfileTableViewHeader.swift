//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by Md Shohidur Rahman on 5/11/23.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    
    private enum SecrtionTabs: String {
        case tweets = "Tweets"
        case tweetsAndReplies = "Tweets & Replies"
        case media = "Media"
        case likes = "Likes"
        
        
        var index: Int {
            switch self {
            case .tweets:
                return 0
                
            case .tweetsAndReplies:
                return 1
                
            case .media:
                return 2
                
            case .likes:
                return 3
            }
        }
    }
    
    private var selectedTab: Int = 0{
        didSet{
            print(selectedTab)
        }
    }
    
    private var tabs: [UIButton] = ["Tweets","Tweets & Replies","Media","Likes"]
        .map{ buttonTitle in
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.tintColor = .label
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
    
    private lazy  var sectionStack: UIStackView = {
      let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private let followersTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Followers"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    
    private let followersContLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "313"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let followingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Following"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
     
    
    private let followingCountLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "9786"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let joinDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Joined July 2021"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    
    private let joinDateImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .secondaryLabel
        imageView.image = UIImage(systemName: "calender", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        return imageView
    }()
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = .label
        label.text = "IOS and WEB developer"
        return label
        
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@rms25d"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .secondaryLabel
        return label
        
    }()
    
    private let displayNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "msr"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let profileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(named: "avatar")
        imageView.backgroundColor = .systemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let profileHeaderImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "header")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame )
        addSubview(profileHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)
        addSubview(usernameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinDateLabel)
        addSubview(followingCountLabel)
        addSubview(followersContLabel)
        addSubview(followingTextLabel)
        addSubview(followersContLabel)
        addSubview(followingTextLabel)
        addSubview(sectionStack)
        configureConstraints()
        configureStackButton()
        
        
    }
    
    
    private func configureStackButton(){
        for (_, button) in sectionStack.arrangedSubviews.enumerated(){
            guard let button = button as? UIButton else{return}
            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton){
        
        guard let label = sender.titleLabel?.text else { return}
        
        switch label {
        case SecrtionTabs.tweets.rawValue:
            selectedTab = 0
        case SecrtionTabs.tweetsAndReplies.rawValue:
            selectedTab = 1
        case SecrtionTabs.media.rawValue:
            selectedTab = 2
        case SecrtionTabs.likes.rawValue:
            selectedTab = 3
            
        default:
            selectedTab = 0
        
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func configureConstraints(){
        
        let profileHeaderImageViewConstraints = [
            profileHeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderImageView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        
        let profileAvatarImageViewConstraints = [
            profileAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileAvatarImageView.centerYAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor,constant: 10),
            profileHeaderImageView.widthAnchor.constraint(equalToConstant: 80),
            profileHeaderImageView.heightAnchor.constraint(equalToConstant: 80),
        ]
        
        let displayNameLabelConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: profileAvatarImageView.leadingAnchor),
            displayNameLabel.topAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor,constant: 20)
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor,constant: 5)
        
        ]
        
        let userBioLabelConstraints = [
            userBioLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            userBioLabel.trailingAnchor.constraint(equalTo:trailingAnchor , constant: -5),
            userBioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5)
            
        
        ]
        
        let joinDateImageViewConstraints = [
            joinDateImageView.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            joinDateImageView.topAnchor.constraint(equalTo: userBioLabel.bottomAnchor, constant: 5)
        
        ]
        
        let joinDateLabelConstraints = [
            joinDateLabel.leadingAnchor.constraint(equalTo: joinDateImageView.trailingAnchor,constant: 2),
            joinDateLabel.bottomAnchor.constraint(equalTo: joinDateImageView.bottomAnchor),
            
        ]
        
        let followingCountLabelConstraints = [
            followingCountLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            followingCountLabel.topAnchor.constraint(equalTo: joinDateLabel.bottomAnchor,constant: 10)
            
        ]
        
        let followingTextLabelConstraints = [
            followingTextLabel.leadingAnchor.constraint(equalTo: followingCountLabel.trailingAnchor,constant: 4),
            followingTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]
        
        let followersCountLabelConstraints = [
        
            followersContLabel.leadingAnchor.constraint(equalTo: followingTextLabel.trailingAnchor,constant: 8),
            followersContLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]
        
        let followersTextLabelConstraints = [
            followersTextLabel.leadingAnchor.constraint(equalTo: followersContLabel.trailingAnchor,constant: 4),
            followersTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]
        
        let sectionStackConstraints = [
            sectionStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            sectionStack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            sectionStack.topAnchor.constraint(equalTo: followingCountLabel.bottomAnchor,constant: 5),
            sectionStack.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        
        
        NSLayoutConstraint.activate(profileHeaderImageViewConstraints)
        NSLayoutConstraint.activate(profileAvatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(userBioLabelConstraints)
        NSLayoutConstraint.activate(joinDateImageViewConstraints)
        NSLayoutConstraint.activate(joinDateLabelConstraints)
        NSLayoutConstraint.activate(followingCountLabelConstraints)
        NSLayoutConstraint.activate(followingTextLabelConstraints)
        NSLayoutConstraint.activate(followersCountLabelConstraints)
        NSLayoutConstraint.activate(followingTextLabelConstraints)
        NSLayoutConstraint.activate(sectionStackConstraints)
    }
}
