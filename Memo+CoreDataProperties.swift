//
//  Memo+CoreDataProperties.swift
//  CoreDataMemoApp
//
//  Created by 田中大地 on 2022/10/26.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?

}

extension Memo : Identifiable {
    public var stringUpdatedAt: String { dateFormatter(date: updatedAt ?? Date() ) }
    
    internal func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        return dateFormatter.string(from: date)
    }
}
