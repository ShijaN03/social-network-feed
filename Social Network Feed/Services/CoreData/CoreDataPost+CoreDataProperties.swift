//
//  CoreDataPost+CoreDataProperties.swift
//  Social Network Feed
//
//  Created by shijan on 01.08.2025.
//
//

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

}

extension CoreDataPost : Identifiable {

}
