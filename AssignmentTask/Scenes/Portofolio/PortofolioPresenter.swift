//
//  PortofolioPresenter.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import Foundation
import DGCharts

class PortofolioPresenter: PortofolioViewToPresenterProtocol {
    var interactor: PortofolioPresenterToInteractorProtocol?
    var view: PortofolioPresenterToViewProtocol?
    var transactionData: [Transaction] = []
    var donutCharData: [PieChartDataEntry] = []
    var historyTransaction: [DonutChartData] = []
    
    func generateData() {
        interactor?.generateData()
    }
}

extension PortofolioPresenter: PortofolioIntercatorToPresenterProtocol {
    
    func sucsessGetData(data: [ChartData]) {
        
        if let dataChart = data.first(where: { $0.type == "donutChart"}) {
            print("awikwok", dataChart.data)
            let dataChart = dataChart.data
            
            switch (dataChart) {
            case .donutChart(let dataArray):
                self.historyTransaction = dataArray
                self.donutCharData = dataArray.map { item in
                    let value = Double(item.percentage) ?? 0.0
                    let label = item.label
                    return .init(value: value, label: label)
                }
                view?.setUpChart()
                break
            default: break
            }
        }
        
    }
    
    func failedGetData(err: String) {
        //        <#code#>
    }
    
    
}
