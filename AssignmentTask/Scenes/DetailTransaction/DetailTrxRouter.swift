//
//  DetailTrxRouter.swift
//  AssignmentTask
//
//  Created by mymac on 24/09/23.
//

import Foundation
import UIKit

class DetailTrxRouter: DetailTrxPresenterToRouter {
    
    static func createModule(list: [Transaction], title: String) -> UIViewController {
        var vc = DetailTrxViewController()
        var presenter: DetailTrxViewToPresenterProtocol = DetailTrxPresenter(list: list, title: title)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
