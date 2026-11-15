//
//  BookDetailView.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import SwiftUI

struct BookDetailView: View {
    var book: Book
    
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
            
            VStack (spacing: 15) {
                HStack (spacing: 3) {
                    Spacer()
                    
                    if let rating = book.rating {
                        
                        Text("\(rating)")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    } else {
                        Text("Нет оценки")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "star.fill")
                            .foregroundStyle(.gray)
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Text(book.readStatus.statusName)
                        .font(.headline)
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
