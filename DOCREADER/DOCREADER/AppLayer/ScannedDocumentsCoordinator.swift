//
//  ScannedDocumentsCoordinator.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import SwiftUI

struct ScannedDocumentsCoordinator: Coordinator {
    func start() -> AnyView {
        let model = ScannedDocumentsModel()
        let presenter = ScannedDocumentsPresenter(model: model)
        let view = ScannedDocumentsView(presenter: presenter)
        return AnyView(view)
    }
}
