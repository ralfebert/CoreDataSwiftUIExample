import CoreData
import Foundation

extension Project {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Project> {
        NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged var name: String
    @NSManaged var todos: Set<Todo>
}

extension Project: Identifiable {}
