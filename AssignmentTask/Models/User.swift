//
//  User.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import Foundation

struct User: Codable{
    var noRek: String
    var name: String
    var saldo: Int
    
    static var user: User = .init(noRek: "9999222233332222", name: "Ade Bayu Septian", saldo: 10_000_000)
}
