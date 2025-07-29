import UIKit

protocol FeedViewProtocol: AnyObject {
    
}

class FeedView: UIViewController {
    
    var presenter: FeedPresenterProtocol?
    
    private var tableView = UITableView()
    private var posts: [FeedPostVM] = [
        FeedPostVM(title: "POST1", body: "SDFSDFSDFSDF"),
        FeedPostVM(title: "POST1", body: "SDFSDFSDFSDF"),
        FeedPostVM(title: "POST1", body: "SDFSDFSDFSDF"),
        FeedPostVM(title: "POST1", body: "SDFSDFSDFSDF")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  UIColor.FeedBackgroundColor
        
        setUpUI()
    }
    
    private func setUpUI() {
        setUpTableView()
    }
    
    private func setUpTableView() {
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FeedView: FeedViewProtocol {
    
}

extension FeedView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell else { return UITableViewCell() }
        
        let post = posts[indexPath.row]
        
        cell.configure(with: post)
        
        return cell
    }
    
    
}

