import UIKit

class FeedCell: UITableViewCell {
    
    static let identifier = "FeedCell"
    
    private let postView = UIView()
    private let avatar = UIImageView()
    private let avatarBackground = UIView()
    private let username = UILabel()
    private let userInfoStack = UIStackView()
    private let postTitle = UILabel()
    private let postBody = UILabel()
    private let likeButton = UIButton()
    
    var likeButtonTapped: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    override func layoutSubviews() {
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeTapped() {
        likeButtonTapped?()
        
    }
    
    func configure(with entity: FeedPostVM) {
        postBody.text = entity.body
        postTitle.text = entity.title
        username.text = entity.userName
        avatar.load(from: entity.avatarURL)
        
        likeButton.tintColor = entity.isLiked ? .red : .gray
        likeButton.setImage(
            UIImage(systemName: entity.isLiked ? "heart.fill" : "heart",
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: 28,
                        weight: .regular)),
            for: .normal)
    }
    
    private func setUpUI() {
        
        setUpPostView()
        setUpAvatar()
        setUpUserInfo()
        setUpLikeButton()
        setUpPostTitle()
        setUpPostBody()
        
        postView.bringSubviewToFront(likeButton)
        
        backgroundColor = .clear
        
    }
    
    private func setUpPostView() {
        contentView.addSubview(postView)
        
        postView.backgroundColor = UIColor.FeedPostBackgroundColor
        postView.layer.cornerRadius = 12
        
        postView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    private func setUpUserInfo() {
        
        let background = UIView()
        
        background.backgroundColor = UIColor.FeedPostUserInfoBackgroundColor
        background.layer.cornerRadius = 20
        
        username.textColor = UIColor.FeedPostUsernameColor
        username.font = UIFont.boldSystemFont(ofSize: 20)
        username.numberOfLines = 1
        
        userInfoStack.axis = .horizontal
        userInfoStack.spacing = 8
        userInfoStack.alignment = .center
        
        userInfoStack.addArrangedSubview(avatarBackground)
        userInfoStack.addArrangedSubview(username)
        
        background.addSubview(userInfoStack)
        postView.addSubview(background)
        
        username.translatesAutoresizingMaskIntoConstraints = false
        userInfoStack.translatesAutoresizingMaskIntoConstraints = false
        background.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: postView.topAnchor, constant: 10),
            background.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 10),
            background.trailingAnchor.constraint(lessThanOrEqualTo: postView.trailingAnchor, constant: -50),
            background.heightAnchor.constraint(equalToConstant: 40),
            
            userInfoStack.topAnchor.constraint(equalTo: background.topAnchor),
            userInfoStack.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 5),
            userInfoStack.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -8),
            userInfoStack.bottomAnchor.constraint(equalTo: background.bottomAnchor)
            
            
        ])
        
    }
    
    private func setUpAvatar() {
        
        avatarBackground.backgroundColor = UIColor.FeedPostUserWithoutAvatarBackgroundColor
        avatarBackground.layer.cornerRadius = 16
        avatar.tintColor = UIColor.FeedPostUserWithoutAvatarColor
        
        avatarBackground.addSubview(avatar)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatarBackground.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarBackground.heightAnchor.constraint(equalToConstant: 32),
            avatarBackground.widthAnchor.constraint(equalToConstant: 32),
            avatar.topAnchor.constraint(equalTo: avatarBackground.topAnchor),
            avatar.leadingAnchor.constraint(equalTo: avatarBackground.leadingAnchor),
            avatar.trailingAnchor.constraint(equalTo: avatarBackground.trailingAnchor),
            avatar.bottomAnchor.constraint(equalTo: avatarBackground.bottomAnchor)
        ])
        
    }
    
    private func setUpLikeButton() {
        
        postView.addSubview(likeButton)
        
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 52),
            likeButton.widthAnchor.constraint(equalToConstant: 52),
            
            likeButton.topAnchor.constraint(equalTo: postView.topAnchor, constant: 5),
            likeButton.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -5),
            
        ])
    }
    
    private func setUpPostTitle() {
        
        let background = UIView()
        
        background.backgroundColor = UIColor.FeedPostBackgroundColor
        background.layer.cornerRadius = 16
        
        background.addSubview(postTitle)
        
        postView.addSubview(background)
        
        postTitle.textColor = UIColor.FeedPostTitleColor
        postTitle.font = UIFont.boldSystemFont(ofSize: 20)
        postTitle.numberOfLines = 1
        
        background.translatesAutoresizingMaskIntoConstraints = false
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 20),
            background.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 10),
            background.trailingAnchor.constraint(lessThanOrEqualTo: postView.trailingAnchor, constant: -50),
            background.heightAnchor.constraint(equalToConstant: 30),
            
            postTitle.topAnchor.constraint(equalTo: background.topAnchor),
            postTitle.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 0), // Если решу удалить background
            postTitle.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -8),
            postTitle.bottomAnchor.constraint(equalTo: background.bottomAnchor)
        ])
    }
    
    private func setUpPostBody() {
        
        postView.addSubview(postBody)
        
        postBody.textColor = UIColor.FeedPostBodyColor
        postBody.font = UIFont.systemFont(ofSize: 16)
        postBody.numberOfLines = 0
        
        postBody.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postBody.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 10),
            postBody.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 10),
            postBody.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -10),
            postBody.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -10)
            
        ])
    }
    
}

