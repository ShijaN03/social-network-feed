import Foundation

protocol FeedPresenterProtocol: AnyObject {
    
    func viewDidLoad()
    func didPullToRefresh()
    func toggleLike(forPostId: Int, isLiked: Bool)
}

class FeedPresenter {
    
    weak var view: FeedViewProtocol?
    var interactor: FeedInteractorInputProtocol?
    var router: FeedRouterProtocol?
    
    
    
}

extension FeedPresenter: FeedPresenterProtocol {
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func didPullToRefresh() {
        interactor?.fetchData()
    }
    
    func toggleLike(forPostId: Int, isLiked: Bool) {
        interactor?.updateLike(forPostId: forPostId, isLiked: isLiked)
    }
    
}

extension FeedPresenter: FeedInteractorOutputProtocol {
    
    func didFetchPosts(posts: [Post]) {
        let viewModels = posts.map {
            FeedPostVM(id: $0.id, title: $0.title, body: $0.body, userName: $0.userName, avatarURL: $0.avatarURL, isLiked: $0.isLiked)
        }
        self.view?.showPosts(posts: viewModels)
        
    }
}
