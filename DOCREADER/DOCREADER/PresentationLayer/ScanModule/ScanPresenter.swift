//
//  ScanPresenter.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import VisionKit
import PDFKit
import SwiftData

class ScanPresenter {
    var view: ScanViewProtocol?
    let model: ScanModel
    
    init(model: ScanModel = ScanModel()) {
        self.model = model
    }
    
    func didFinishScanning(result: VNDocumentCameraScan, context: ModelContext) {
        guard let pdfData = convertToPDF(scan: result) else { return }
        let name = "Scanned_\(Date().formatted(date: .abbreviated, time: .omitted))"
        
        
        if result.pageCount > 0 {
            let scannedImage = result.imageOfPage(at: 0)
            model.createAndSaveThumbnail(name: name, image: scannedImage, context: context)
        } else {
            model.saveDocument(name: name + ".pdf", data: pdfData, context: context)
        }
        
        view?.showSuccessMessage()
    }
    
    func didCancelScanning() {
        view?.dismissScanner()
    }
    
    private func convertToPDF(scan: VNDocumentCameraScan) -> Data? {
        let pdfDocument = PDFDocument()
        for i in 0..<scan.pageCount {
            let image = scan.imageOfPage(at: i)
            let pdfPage = PDFPage(image: image)
            pdfDocument.insert(pdfPage!, at: i)
        }
        return pdfDocument.dataRepresentation()
    }
}
