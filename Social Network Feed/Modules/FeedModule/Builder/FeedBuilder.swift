import UIKit

final class FeedBuilder {
    
    static func build() -> UIViewController {
        
        let coreDataRepository = CoreDataPostRepository(context: CoreDataManager.shared.context)
        let apiService = APIService()
        let view = FeedView()
        let presenter = FeedPresenter()
        let interactor = FeedInteractor(coreDataRepository: coreDataRepository)
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

