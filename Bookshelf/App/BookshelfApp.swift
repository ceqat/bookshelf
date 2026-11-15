import SwiftUI
import SwiftData

@main struct BookshelfApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryView()
        }
        .modelContainer(for: Book.self)
    }
}
