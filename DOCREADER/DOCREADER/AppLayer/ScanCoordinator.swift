//
//  ScanCoordinator.swift
//  DOCREADER
//
//  Created by Константин Клинов on 03/09/25.
//

import SwiftUI

struct ScanCoordinator: Coordinator {
    func start() -> AnyView {
        let model = ScanModel()
        let presenter = ScanPresenter(model: model)
        let view = ScanView(presenter: presenter)
        presenter.view = view
        return AnyView(view)
    }
}
