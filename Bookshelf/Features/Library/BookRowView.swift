//
//  BookRowView.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import SwiftUI

struct BookRowView: View {
    var book: Book
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(book.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(book.author)
                    .font(.footnote)
            }
            Spacer()
            
            if let rating = book.rating {
                Text("\(rating)")
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            
            Text(book.readStatus.statusName)
        }
    }
}

#Preview ("С оценкой") {
    BookRowView(book: Book(name: "Мгла", author: "Стивен Кинг", readStatus: .done, rating: 5))
}

#Preview ("Без оценки") {
    BookRowView(book: Book(name: "Долгая прогулка", author: "Стивен Кинг", readStatus: .done))
}
