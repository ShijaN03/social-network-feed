import UIKit

class HeadView: UIView {
    
    private let titleLabel = UILabel()
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        titleLabel.text = title
        
        setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        self.backgroundColor = UIColor.HeadViewBackgroundColor
        
        self.addSubview(titleLabel)
        
        setUpTitleLabel()
       
    }
    
    private func setUpTitleLabel() {
        
        titleLabel.textColor = UIColor.HeadViewTextColor
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 30)
        ])
    }
    
    
}
