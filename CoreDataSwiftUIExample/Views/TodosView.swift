import CoreData
import SwiftUI

struct TodosView: View {
    @FetchRequest(fetchRequest: Project.all) var projects: FetchedResults<Project>
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        NavigationView {
            List {
                ForEach(self.projects) { (project: Project) in
                    Section(header: Text(project.name)) {
                        ForEach(project.todos.sorted { $0.id < $1.id }) { todo in
                            Text(todo.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Todos", displayMode: .inline)
            .navigationBarItems(trailing: addButton)
        }
    }

    var addButton: some View {
        Button(
            action: {
                let project = Project.create(in: self.managedObjectContext)
                project.name = "Project \(Date())"

                let todo = Todo.create(in: self.managedObjectContext)
                todo.name = "Example \(Date())"
                todo.projects = [project, try! managedObjectContext.fetch(Project.all).randomElement()!]

                try! self.managedObjectContext.save()
            },
            label: {
                Image(systemName: "plus")
            }
        )
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView()
            .environment(\.managedObjectContext, CoreDataStack.shared.persistentContainer.viewContext)
    }
}
