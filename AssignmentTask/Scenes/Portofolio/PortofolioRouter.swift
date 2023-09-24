//
//  PortofolioRouter.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import Foundation
import UIKit

class PortofolioRouter: PortofolioPresenterToRouter {
    static func createModule() -> UIViewController {

        let view = PortofolioViewController()
        let presenter: PortofolioViewToPresenterProtocol & PortofolioIntercatorToPresenterProtocol = PortofolioPresenter()
        let interactor: PortofolioPresenterToInteractorProtocol = PortofolioInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
