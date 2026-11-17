//
//  Book.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import Foundation
import SwiftData

@Model final class Book {
    var name: String
    var author: String
    var readStatus: ReadStatus
    var rating: Int?
    var createDate: Date
    
    init(name: String, author: String, readStatus: ReadStatus, rating: Int? = nil) {
        self.name = name
        self.author = author
        self.readStatus = readStatus
        self.rating = rating
        self.createDate = Date()
    }
}

enum ReadStatus: Codable, CaseIterable {
    case wantToRead
    case reading
    case done
    
    var statusName: String {
        switch self {
        case .done: return "Прочитано"
        case .reading: return "Читаю"
        case .wantToRead: return "Хочу прочитать"
        }
    }
}
