import CoreData
import Foundation

public extension Todo {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Todo> {
        NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged var name: String
}

extension Todo: Identifiable {}
