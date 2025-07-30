import UIKit

final class FeedBuilder {
    
    static func build() -> UIViewController {
        
        var apiService = APIService()
        let view = FeedView()
        let presenter = FeedPresenter()
        let interactor = FeedInteractor()
        let router = FeedRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.apiService = apiService
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}

