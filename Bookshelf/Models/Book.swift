//
//  Book.swift
//  Bookshelf
//
//  Created by Роман on 14.11.2026.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let author: String
    var readStatus: ReadStatus
    var rating: Int?
}

enum ReadStatus: CaseIterable {
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
