//
//  UserDefaults.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import Foundation

extension UserDefaults {
    func setUser(data: User?) {
        guard let data = data else {
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.user.rawValue)
            return
        }
        
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            set(encodedData, forKey: UserDefaultsKeys.user.rawValue)
        } catch { }
    }
    
    func getUser() -> User? {
        if let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.user.rawValue) {
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(User.self, from: data)
                return decodedData
            } catch { }
            
        }
        
        return nil
    }
}

