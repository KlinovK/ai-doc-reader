//
//  AppCoordinator.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import SwiftUI

protocol Coordinator {
    func start() -> AnyView
}

class AppCoordinator: Coordinator {
    func start() -> AnyView {
        AnyView(TabView {
            ScanCoordinator().start()
                .tabItem {
                    Label("Scan", systemImage: "camera")
                }
            ScannedDocumentsCoordinator().start()
                .tabItem {
                    Label("Documents", systemImage: "doc.text")
                }
        }
        .accentColor(.gray) 
        .modelContainer(for: Document.self))
    }
}
