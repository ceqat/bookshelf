//
//  LibraryView.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import SwiftUI
import SwiftData

struct LibraryView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isAddBookViewPresented: Bool = false
    @Query private var books: [Book]
    
    var body: some View {
        NavigationStack {
            List(books) { book in
                NavigationLink (value: book) {
                    BookRowView(book: book)
                }
            }
            .navigationTitle("Библиотека")
            .toolbar {
                ToolbarItem (placement: .primaryAction){
                    Button {
                        isAddBookViewPresented = true
                    } label: {
                        Label("Добавить книгу", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(for: Book.self) { selectedBook in
                BookDetailView(book: selectedBook)
            }
            .sheet(isPresented: $isAddBookViewPresented) {
                AddBookView { book in
                    modelContext.insert(book)
                }
            }
        }
    }
}

#Preview {
    LibraryView()
        .modelContainer(for: Book.self, inMemory: true)
}
