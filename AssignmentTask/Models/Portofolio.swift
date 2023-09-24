//
//  Portofolio.swift
//  AssignmentTask
//
//  Created by mymac on 24/09/23.
//

import Foundation

// The main struct that represents the entire JSON content
struct ChartData: Decodable {
    var type: String
    var data: ChartTypeData
}

enum ChartTypeData: Decodable {
    case donutChart([DonutChartData])
    case lineChart(LineChartData)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let dataArray = try? container.decode([DonutChartData].self) {
            self = .donutChart(dataArray)
            return
        }

        if let dataObject = try? container.decode(LineChartData.self) {
            self = .lineChart(dataObject)
            return
        }

        throw DecodingError.dataCorruptedError(in: container,
                 debugDescription: "Mismatched Types")
    }
}

struct DonutChartData: Decodable {
    var label: String
    var percentage: String
    var data: [Transaction]
}

struct Transaction: Decodable {
    var trx_date: String
    var nominal: Int
}

struct LineChartData: Decodable {
    var month: [Int]
}
