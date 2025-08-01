import Foundation

protocol FeedPresenterProtocol: AnyObject {
    
    func viewDidLoad()
    func didPullToRefresh()
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
    
}

extension FeedPresenter: FeedInteractorOutputProtocol {
    
    func didFetchPosts(posts: [Post]) {
        let viewModels = posts.map {
            FeedPostVM(title: $0.title, body: $0.body, userName: $0.userName)
        }
        self.view?.showPosts(posts: viewModels)
        
    }
}
