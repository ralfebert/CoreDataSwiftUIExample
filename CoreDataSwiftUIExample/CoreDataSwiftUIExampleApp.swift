import SwiftUI

@main
struct CoreDataSwiftUIExampleApp: App {
    var body: some Scene {
        WindowGroup {
            TodosView()
                .environment(\.managedObjectContext, CoreDataStack.shared.persistentContainer.viewContext)
        }
    }
}
