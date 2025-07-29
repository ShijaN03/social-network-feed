protocol FeedPresenterProtocol: AnyObject {
    
}

class FeedPresenter {
    
    weak var view: FeedViewProtocol?
    var interactor: FeedInteractorProtocol?
    var router: FeedRouterProtocol?
    
    
}

extension FeedPresenter: FeedPresenterProtocol {
    
    
}
