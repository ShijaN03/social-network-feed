import UIKit

protocol FeedViewProtocol: AnyObject {
    func showPosts(posts: [FeedPostVM])
}

class FeedView: UIViewController {
    
    var presenter: FeedPresenterProtocol?
    
    private let loadingIndicator = UIActivityIndicatorView()
    private let refreshControl = UIRefreshControl()
    private let headView = HeadView(frame: .zero, title: "Лента")
    private var tableView = UITableView()
    
    private var posts: [FeedPostVM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  UIColor.FeedBackgroundColor
        setUpUI()
        presenter?.viewDidLoad()
    }
    
    @objc private func handleRefresh() {
        presenter?.didPullToRefresh()
    }
    
    private func setUpUI() {
        setUpHeadView()
        setUpTableView()
        setUpRefreshControl()
        showLoadingIndicator()
    }
    
    private func showLoadingIndicator() {
        view.addSubview(loadingIndicator)
        loadingIndicator.style = .large
        loadingIndicator.color = .gray
        loadingIndicator.hidesWhenStopped = true
        
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        loadingIndicator.startAnimating()
    }
    
    private func setUpRefreshControl() {
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    private func setUpHeadView() {
        view.addSubview(headView)
        
        headView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headView.topAnchor.constraint(equalTo: view.topAnchor),
            headView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setUpTableView() {
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FeedView: FeedViewProtocol {
    
    func showPosts(posts: [FeedPostVM]) {
        self.posts = posts
        tableView.reloadData()
        refreshControl.endRefreshing()
        loadingIndicator.stopAnimating()
        
    }
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

