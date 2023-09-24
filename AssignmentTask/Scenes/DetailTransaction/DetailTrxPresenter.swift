//
//  DetailTrxPresenter.swift
//  AssignmentTask
//
//  Created by mymac on 24/09/23.
//

import Foundation

class DetailTrxPresenter: DetailTrxViewToPresenterProtocol {
    var listTrx: [Transaction]
    var title: String
    init(list : [Transaction], title: String) {
        self.listTrx = list
        self.title = title
    }
    
}
