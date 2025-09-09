//
//  ScannedDocumentsPresenter.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import Foundation
import SwiftData

class ScannedDocumentsPresenter {
    let model: ScannedDocumentsModel
    
    init(model: ScannedDocumentsModel = ScannedDocumentsModel()) {
        self.model = model
    }
    
    public func fetchDocuments(context: ModelContext) -> [Document] {
        model.fetchDocuments(context: context)
    }
    
    public func deleteDocument(_ document: Document, context: ModelContext) {
        model.deleteDocument(document, context: context)
    }
}
