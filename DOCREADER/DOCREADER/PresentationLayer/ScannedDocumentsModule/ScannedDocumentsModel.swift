//
//  ScannedDocumentsModel.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import Foundation
import SwiftData

class ScannedDocumentsModel {
    
    func fetchDocuments(context: ModelContext) -> [Document] {
        let descriptor = FetchDescriptor<Document>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func deleteDocument(_ document: Document, context: ModelContext) {
        context.delete(document)
        try? context.save()
    }
}
