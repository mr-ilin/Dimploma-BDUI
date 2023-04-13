//
//  MainCoordinator.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import UIKit
import TinyConstraints

final class MainCoordinator: Coordinator {
    override func start() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white

        if let bduiController = prepareController(),
           let renderedView = bduiController.render()
        {
            vc.view.addSubview(renderedView)
            renderedView.edgesToSuperview(usingSafeArea: true)
        }

        push(vc, animated: true)
    }

    private func getConfiguration() -> BDUIConfiguration? {
        guard let path = Bundle.main.path(forResource: "configuration", ofType: "json") else {
            return nil
        }

        do {
            let configurationData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return BDUIParser.parseUIConfiguration(jsonData: configurationData)
        } catch {
            NSLog("Cant get file")
            return nil
        }
    }

    private func prepareController() -> BDUIController? {
        guard let configuration = getConfiguration() else {
            return nil
        }

        let factory: BDUIViewFactory = BDUIViewFactoryImpl()

        return BDUIControllerImpl(configuration: configuration, viewFactory: factory)
    }
}
