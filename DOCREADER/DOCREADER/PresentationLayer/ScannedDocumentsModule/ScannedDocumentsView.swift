//
//  ContentView.swift
//  DOCREADER
//
//  Created by Константин Клинов on 02/09/25.
//

import SwiftUI
import PDFKit

struct ScannedDocumentsView: View {
    @State private var documents: [Document] = []
    @Environment(\.modelContext) private var modelContext
    let presenter: ScannedDocumentsPresenter
    @State private var selectedDocument: Document?
    
    var body: some View {
        NavigationStack {
            
            List {
                if documents.isEmpty {
                    Text("No documents found")
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    ForEach(documents) { document in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(document.name)
                                    .font(.headline)
                                Text(document.date, style: .date)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedDocument = document
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            presenter.deleteDocument(documents[index], context: modelContext)
                        }
                    }
                }
            }
           
            .navigationTitle("Scanned Documents")
            .sheet(item: $selectedDocument) { document in
                PDFViewer(data: document.data)
            }
            .onAppear {
                documents = presenter.fetchDocuments(context: modelContext)
            }
        }
    }
}

