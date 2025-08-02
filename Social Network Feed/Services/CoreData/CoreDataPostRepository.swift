import CoreData

final class CoreDataPostRepository {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func updateLike(for postId: Int, isLiked: Bool) {
        let request = CoreDataPost.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", postId)
        
        do {
            let fetchResult = try context.fetch(request)
            
            let post = fetchResult.first
            post?.isLiked = isLiked
            CoreDataManager.shared.saveContext()
            
        } catch {
            print("\(error)")
        }
    }
    
    func savePosts(_ posts: [Post]) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CoreDataPost.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch {
            print("\(error)")
        }
        
        for post in posts {
            let entity = CoreDataPost(context: context)
            entity.id = Int64(post.id)
            entity.userId = Int64(post.userId)
            entity.title = post.title
            entity.body = post.body
            entity.userName = post.userName
            entity.avatarURL = post.avatarURL.absoluteString
        }
        
        CoreDataManager.shared.saveContext()
    }
    
    
    func loadPosts() -> [Post] {
        let request: NSFetchRequest<CoreDataPost> = CoreDataPost.fetchRequest()
        do {
            let results = try context.fetch(request)
            return results.map {
                Post(
                    id: Int($0.id),
                    userId: Int($0.userId),
                    title: $0.title ?? "",
                    body: $0.body ?? "",
                    userName: $0.userName ?? "",
                    avatarURL: URL(string: $0.avatarURL ?? "https://picsum.photos/200")!,
                    isLiked: $0.isLiked
                )
            }
        } catch {
            print("\(error)")
            return []
        }
    }
}
