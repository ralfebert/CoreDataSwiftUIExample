import CoreData
import Foundation

@objc(Project)
public class Project: NSManagedObject {
    static var all: NSFetchRequest<Project> {
        let request: NSFetchRequest<Project> = Project.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return request
    }

    static func create(in ctx: NSManagedObjectContext) -> Project {
        NSEntityDescription.insertNewObject(forEntityName: "Project", into: ctx) as! Project
    }
}
