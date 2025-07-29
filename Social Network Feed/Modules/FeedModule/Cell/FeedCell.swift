import UIKit

class FeedCell: UITableViewCell {
    
    static let identifier = "FeedCell"
    
    private let containerView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.FeedPostBackgroundColor
        view.layer.cornerRadius = 12
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let feedLabel: UILabel = {
        
        let label = UILabel()
        
        label.textColor = UIColor.FeedPostTextColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func configure(with entity: FeedPostVM) {
        feedLabel.text = entity.title
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(feedLabel)
        
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 400),
        
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            feedLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            feedLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

