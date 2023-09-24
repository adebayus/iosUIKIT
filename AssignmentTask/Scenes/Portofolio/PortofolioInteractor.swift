//
//  PortofolioInteractor.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import Foundation

class PortofolioInteractor: PortofolioPresenterToInteractorProtocol {
    var presenter: PortofolioIntercatorToPresenterProtocol?
    
    func generateData() {
        if let url = Bundle.main.url(forResource: "PortofolioData", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([ChartData].self, from: jsonData)
                presenter?.sucsessGetData(data: decodedData)
                print(decodedData)
            } catch {
                print("Error decoding JSON: \(error)")
                presenter?.failedGetData(err: error.localizedDescription)
            }
        }
    }
}
