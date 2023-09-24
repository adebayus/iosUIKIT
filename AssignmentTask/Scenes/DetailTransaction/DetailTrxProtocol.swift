//
//  DetailTrxProtocol.swift
//  AssignmentTask
//
//  Created by mymac on 24/09/23.
//

import Foundation
import UIKit

protocol DetailTrxPresenterToRouter: AnyObject {
    static func createModule(list: [Transaction], title: String) -> UIViewController
}

protocol DetailTrxViewToPresenterProtocol: AnyObject {
    var listTrx: [Transaction] { get set }
    var title: String { get set }
}
