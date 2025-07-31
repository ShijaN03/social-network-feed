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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with entity: FeedPostVM) {
        postBody.text = entity.body
        postTitle.text = entity.title
        username.text = entity.userName
        
    }
    
    private func setUpUI() {
        setUpPostView()
        setUpAvatar()
        setUpUserInfo()
        setUpPostTitle()
        setUpPostBody()
        
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
        
        username.textColor = UIColor.FeedPostUsernameColor
        username.font = UIFont.boldSystemFont(ofSize: 20)
        username.numberOfLines = 1
        
        userInfoStack.axis = .horizontal
        userInfoStack.spacing = 8
        userInfoStack.alignment = .center
        
        userInfoStack.addArrangedSubview(avatarBackground)
        userInfoStack.addArrangedSubview(username)
        
        postView.addSubview(userInfoStack)
        
        username.translatesAutoresizingMaskIntoConstraints = false
        userInfoStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userInfoStack.topAnchor.constraint(equalTo: postView.topAnchor, constant: 10),
            userInfoStack.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 10),
            userInfoStack.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -50),
            userInfoStack.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    private func setUpAvatar() {
        
        avatarBackground.backgroundColor = UIColor.FeedPostUserWithoutAvatarBackgroundColor
        avatarBackground.layer.cornerRadius = 16
        avatar.image = UIImage(systemName: "person.crop.circle")
        avatar.tintColor = UIColor.FeedPostUserWithoutAvatarColor
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        
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
    
    private func setUpPostTitle() {
        postView.addSubview(postTitle)
        
        postTitle.textColor = UIColor.FeedPostTitleColor
        postTitle.font = UIFont.boldSystemFont(ofSize: 20)
        postTitle.numberOfLines = 1
        
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postTitle.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            postTitle.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 10),
            postTitle.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -50),
            postTitle.heightAnchor.constraint(equalToConstant: 30)
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

