//
//  ScanModel.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import SwiftData
import CoreGraphics
import UIKit

class ScanModel {
    
    func saveDocument(name: String, data: Data, context: ModelContext) {
        let document = Document(name: name, data: data)
        context.insert(document)
        do {
            try context.save()
        } catch {
            print("Failed to save document: \(error)")
        }
    }
}
