//
//  PDFViewer.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import SwiftUI
import PDFKit

struct PDFViewer: View {
    let data: Data
    
    var body: some View {
        if let pdfDocument = PDFDocument(data: data) {
            PDFKitView(pdfDocument: pdfDocument)
        } else {
            Text("Unable to load document")
        }
    }
}

struct PDFKitView: UIViewRepresentable {
    let pdfDocument: PDFDocument
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {}
}
