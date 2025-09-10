//
//  ScanPresenter.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import VisionKit
import SwiftData

class ScanPresenter {
    var view: ScanViewProtocol?
    let model: ScanModel
    
    init(model: ScanModel = ScanModel()) {
        self.model = model
    }
    
    func didFinishScanning(result: VNDocumentCameraScan, context: ModelContext) {
        guard result.pageCount > 0 else {
            view?.dismissScanner()
            return
        }
        
        let scannedImage = result.imageOfPage(at: 0)
        let name = "Scanned_\(Date().formatted(date: .abbreviated, time: .omitted))"
        
        guard let imageData = scannedImage.jpegData(compressionQuality: 1.0) else {
            view?.dismissScanner()
            return
        }
        
        model.saveDocument(name: name + ".jpg", data: imageData, context: context)
        
        view?.showSuccessMessage()
    }
    
    func didCancelScanning() {
        view?.dismissScanner()
    }
}
