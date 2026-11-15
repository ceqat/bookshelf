//
//  LibraryView.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import SwiftUI

struct LibraryView: View {
    @State private var isAddBookViewPresented: Bool = false
    @State private var books: [Book] = [
        Book(name: "Мгла", author: "Стивен Кинг", readStatus: .done),
        Book(name: "Долгая прогулка", author: "Стивен Кинг", readStatus: .reading),
        Book(name: "Гарри Поттер", author: "Джоан Роулинг", readStatus: .wantToRead, rating: 5)
    ]
    
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
                    books.append(book)
                }
            }
        }
    }
}

#Preview {
    LibraryView()
}
