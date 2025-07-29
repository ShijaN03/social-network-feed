import UIKit

final class FeedBuilder {
    
    static func build() -> UIViewController {
        let view = FeedView()
        let presenter = FeedPresenter()
        let interactor = FeedInteractor()
        let router = FeedRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = view
        
        return view
    }
}

