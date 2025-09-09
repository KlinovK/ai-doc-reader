//
//  Document.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import SwiftData
import Foundation

@Model
final class Document {
    @Attribute(.unique)
    var id: UUID
    
    var name: String
    
    @Attribute(.externalStorage)
    var data: Data
    
    var date: Date
    
    init(id: UUID = UUID(), name: String, data: Data, date: Date = Date()) {
        self.id = id
        self.name = name
        self.data = data
        self.date = date
    }
}
