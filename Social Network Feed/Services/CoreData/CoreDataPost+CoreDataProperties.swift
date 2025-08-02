
import Foundation
import CoreData


extension CoreDataPost {

    public class func fetchRequest() -> NSFetchRequest<CoreDataPost> {
        return NSFetchRequest<CoreDataPost>(entityName: "CoreDataPost")
    }

    @NSManaged public var id: Int64
    @NSManaged public var userId: Int64
    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var userName: String?
    @NSManaged public var avatarURL: String?
    @NSManaged public var isLiked: Bool

}

extension CoreDataPost : Identifiable {

}
