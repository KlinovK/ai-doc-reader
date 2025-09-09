//
//  ScanView.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import SwiftUI
import SwiftData

protocol ScanViewProtocol {
    func showSuccessMessage()
    func dismissScanner()
}

struct ScanView: View, ScanViewProtocol {
    @State private var showScanner = false
    @State private var showAlert = false
    @Environment(\.modelContext) private var modelContext
    let presenter: ScanPresenter
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Scan a Document")
                    .font(.title)
                    .foregroundColor(.primary)
                
                Button("Start Scanning") {
                    showScanner = true
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Scan")
            .sheet(isPresented: $showScanner) {
                DocumentScannerView { result in
                    presenter.didFinishScanning(result: result, context: modelContext)
                } onCancel: {
                    presenter.didCancelScanning()
                }
            }
            .alert("Document Saved", isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                Text("Your scanned document has been saved.")
            }
        }
    }
    
    func showSuccessMessage() {
        showAlert = true
        dismissScanner()
    }
    
    func dismissScanner() {
        showScanner = false
    }
}
