protocol FeedInteractorInputProtocol: AnyObject {
    func loadUsers()
    func loadPosts()
    func fetchData()
    var apiService: APIServiceProtocol? { get set }
}

protocol FeedInteractorOutputProtocol: AnyObject {
    func didFetchPosts(posts: [Post])
}

class FeedInteractor: FeedInteractorInputProtocol {
    
    private let coreDataRepository: CoreDataPostRepository?
    weak var presenter: FeedInteractorOutputProtocol?
    
    var apiService: APIServiceProtocol?
    
    private var users: [User] = []
    
    init(coreDataRepository: CoreDataPostRepository?) {
        self.coreDataRepository = coreDataRepository
    }
    
    func fetchData() {
        loadCoreDataPosts()
        loadUsers()
        
    }
    
    func loadUsers() {
        apiService?.extractUsers { [weak self] result in
            switch result {
            case .success(let userDTOs):
                let users = userDTOs.map { User(id: $0.id, name: $0.name) }
                self?.users = users
                self?.loadPosts()
            case .failure(_):
                print("error")
            }
        }
    }
    
    func loadPosts() {
            apiService?.extractPosts { [weak self] result in
                switch result {
                case .success(let postDTOs):
                    guard let self = self else { return }
                    
                    let posts: [Post] = postDTOs.map { postDTO in
                        let userName = self.users.first(where: { $0.id == postDTO.userId })?.name ?? "Без имени"
                        
                        return Post(
                            id: postDTO.id,
                            userId: postDTO.userId,
                            title: postDTO.title,
                            body: postDTO.body,
                            userName: userName
                        )
                    }
                    
                    self.coreDataRepository?.savePosts(posts)
                    self.presenter?.didFetchPosts(posts: posts)
                    
                case .failure(_):
                    print("error")
                }
            }
        }
  
    func loadCoreDataPosts() {
        guard let cachedPosts = coreDataRepository?.loadPosts(), !cachedPosts.isEmpty else { return }
        presenter?.didFetchPosts(posts: cachedPosts)
    }
}


