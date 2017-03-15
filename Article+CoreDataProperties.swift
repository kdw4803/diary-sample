//
//  Article+CoreDataProperties.swift
//  diary
//
//  Created by Brad on 14/03/2017.
//  Copyright © 2017 brad. All rights reserved.
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var createdAt: NSDate?

}
