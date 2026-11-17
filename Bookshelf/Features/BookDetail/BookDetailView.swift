//
//  BookDetailView.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import SwiftUI

struct BookDetailView: View {
    @Bindable var book: Book
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            VStack (alignment: .leading) {
                Text(book.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(book.author)
                    .foregroundStyle(.gray)
                    .font(.headline)
                    .fontWeight(.light)
            }
            
            VStack (alignment: .leading, spacing: 15) {
                LabeledContent("Оценка") {
                    Picker("Оценка", selection: $book.rating) {
                        Text("Без оценки").tag(nil as Int?)
                        
                        ForEach(1...5, id: \.self) { rating in
                            Text("\(rating)").tag(rating)
                        }
                    }
                    .fixedSize()
                    
                    Image(systemName: "star.fill").imageScale(.small)
                        .foregroundStyle(book.rating == nil ? .gray : .yellow)
                }
                
                LabeledContent("Статус") {
                    Picker("Статус", selection: $book.readStatus) {
                        ForEach(ReadStatus.allCases, id: \.self) { status in
                            Text(status.statusName).tag(status)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview("С оценкой") {
    BookDetailView(book: Book(name: "Нануня в цветочном лесу", author: "Ромуся Ромусевич", readStatus: .reading, rating: 5))
}

#Preview("Без оценки") {
    BookDetailView(book: Book(name: "Нануня в цветочном лесу", author: "Ромуся Ромусевич", readStatus: .reading))
}
