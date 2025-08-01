//
//  PostStorage+CoreDataProperties.swift
//  Social Network Feed
//
//  Created by shijan on 01.08.2025.
//
//

import Foundation
import CoreData


extension PostStorage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostStorage> {
        return NSFetchRequest<PostStorage>(entityName: "PostStorage")
    }

    @NSManaged public var id: Int64
    @NSManaged public var userId: Int64
    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var userName: String?

}

extension PostStorage : Identifiable {

}
