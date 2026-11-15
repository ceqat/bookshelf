//
//  AddBookView.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var bookName: String = ""
    @State private var author: String = ""
    @State private var selectedStatus: ReadStatus = .wantToRead
    @State private var selectedRating: Int?
    
    let onSave: (Book) -> Void
    
    private var isValidForm: Bool {
        !isEmptyField(bookName) && !isEmptyField(author)
    }
    
    private func trim(_ field: String) -> String {
        field.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    private func isEmptyField(_ field: String) -> Bool {
        trim(field).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Название книги", text: $bookName)
                
                TextField("Автор", text: $author)
                
                Picker("Статус", selection: $selectedStatus) {
                    ForEach(ReadStatus.allCases, id: \.self) { status in
                        Text(status.statusName).tag(status)
                    }
                }
                .pickerStyle(.inline)
                
                Picker("Оценка", selection: $selectedRating) {
                    Text("Без оценки").tag(nil as Int?)
                    
                    ForEach(1...5, id: \.self) { rating in
                        Text("\(rating)").tag(rating)
                    }
                    
                }
            }
            .navigationTitle("Новая книга")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        onSave(Book(name: trim(bookName), author: trim(author), readStatus: selectedStatus, rating: selectedRating))
                        dismiss()
                    } label: {
                        Text("Сохранить")
                    }
                    .disabled(!isValidForm)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Отменить")
                    }
                }
            }
        }
    }
}

#Preview {
    AddBookView(onSave: {_ in })
}
