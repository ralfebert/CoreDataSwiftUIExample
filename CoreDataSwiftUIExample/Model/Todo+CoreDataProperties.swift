import CoreData
import Foundation

public extension Todo {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Todo> {
        NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged var name: String
    @NSManaged var projects: Set<Project>
}

extension Todo: Identifiable {}
