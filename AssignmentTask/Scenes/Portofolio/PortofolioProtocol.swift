//
//  PortofolioProtocol.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import Foundation
import UIKit
import DGCharts

protocol PortofolioPresenterToRouter: AnyObject {
    static func createModule() -> UIViewController
}

protocol PortofolioPresenterToInteractorProtocol: AnyObject {
    var presenter: PortofolioIntercatorToPresenterProtocol? { get set }
    func generateData()
}

protocol PortofolioViewToPresenterProtocol: AnyObject {
    var interactor: PortofolioPresenterToInteractorProtocol? { get set }
    var view: PortofolioPresenterToViewProtocol? { get set }
    var transactionData: [Transaction] { get set }
    var donutCharData: [PieChartDataEntry] { get set }
    var historyTransaction: [DonutChartData] { get set }
    
    func generateData()
}

protocol PortofolioIntercatorToPresenterProtocol: AnyObject {
    func sucsessGetData(data: [ChartData])
    func failedGetData(err: String)
}

protocol PortofolioPresenterToViewProtocol: AnyObject {
    func setUpChart()
}

