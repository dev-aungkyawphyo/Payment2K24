//
//  DBManager.swift
//  Payment2K24
//
//  Created by Aung Kyaw Phyo on 24/11/2024.
//

import Foundation

class DBManager {
    
    static var shared = DBManager()
    
    private var _db = SQLiteDB.shared
    
    init() {
        openDB()
    }
    
    func openDB() {
        _ = _db.open(copyFile: true)
    }
    
    func closeDB() {
        _db.closeDB()
    }
    
    func userLogin(username: String, password: String) -> [String: Any]? {
        let cmd = "SELECT * FROM users WHERE username = '\(username)' AND password = '\(password)'"
        let rows = _db.query(sql: cmd)
        if rows.count == 1 {
            let row: [String: Any] = rows[0]
            let id = row["id"] as? Int ?? 0
            let username = row["username"] as? String ?? ""
            let isAdmin = row["isadmin"] as? Int ?? 0
            return ["id": id, "username": username, "isAdmin": isAdmin]
        }
        return nil
    }
    
}
