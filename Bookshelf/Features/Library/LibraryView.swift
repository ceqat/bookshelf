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
    @Query(sort: \Book.createDate, order: .reverse) private var books: [Book]
    
    private func deleteBooks(at offset: IndexSet) {
        for index in offset {
            modelContext.delete(books[index])
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if books.isEmpty {
                    ContentUnavailableView {
                        Label("Пока тут пусто", systemImage: "book.badge.plus")
                    } description: {
                        Text("Добавьте первую книгу в вашу библиотеку")
                    } actions: {
                        Button {
                            isAddBookViewPresented = true
                        } label: {
                            Text("Добавить")
                        }
                    }
                } else {
                    List {
                        ForEach(books) { book in
                            NavigationLink (value: book) {
                                BookRowView(book: book)
                            }
                        }
                        .onDelete(perform: deleteBooks)
                    }
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
