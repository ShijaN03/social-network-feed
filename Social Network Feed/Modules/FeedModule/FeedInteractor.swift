protocol FeedInteractorInputProtocol: AnyObject {
    func fetchData()
    var apiService: APIServiceProtocol? { get set }
}

protocol FeedInteractorOutputProtocol: AnyObject {
    
}

class FeedInteractor: FeedInteractorInputProtocol {
    
    weak var presenter: FeedInteractorOutputProtocol?
    
    var apiService: APIServiceProtocol?
    
    func fetchData() {
        
    }
    
}


