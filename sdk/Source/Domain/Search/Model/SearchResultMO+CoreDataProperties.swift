//
//  SearchResultMO+CoreDataProperties.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 22/10/21.
//
//

import Foundation
import CoreData


extension SearchResultMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchResultMO> {
        return NSFetchRequest<SearchResultMO>(entityName: "SearchResultMO")
    }

    @NSManaged public var name: String?

}

extension SearchResultMO : Identifiable {

}
