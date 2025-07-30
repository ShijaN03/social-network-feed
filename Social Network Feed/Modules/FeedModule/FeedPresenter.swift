protocol FeedPresenterProtocol: AnyObject {
    
    func viewDidLoad()
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
    
}

extension FeedPresenter: FeedInteractorOutputProtocol {
    
}
