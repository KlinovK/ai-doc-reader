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

    func createAndSaveThumbnail(name: String, image: UIImage, context: ModelContext) {
        let thumbnailSize = CGSize(width: 200, height: 200)
        let renderer = UIGraphicsImageRenderer(size: thumbnailSize)
        let thumbnail = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: thumbnailSize))
        }
        guard let thumbnailData = thumbnail.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert thumbnail to JPEG data")
            return
        }
        saveDocument(name: name.replacingOccurrences(of: ".pdf", with: "_thumbnail.jpg"), data: thumbnailData, context: context)
    }
}
