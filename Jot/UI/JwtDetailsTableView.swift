//
//  JwtDetailsTableView.swift
//  Jot
//
//  Created by James Griffin-Allwood on 2019-01-01.
//  Copyright © 2019 James Griffin-Allwood. All rights reserved.
//

import Foundation
import Cocoa

extension JwtDetailsViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return getDataArray().count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any?
    {
        guard let payloadRow = getDataArray().object(at: row) as? [String: Any] else {
            return "None"
        }
        
        guard let columnId = tableColumn?.identifier.rawValue else {
            return "None"
        }
        
        return displayString(value: payloadRow[columnId], row: row)
    }
    
    func getDataArray() -> NSArray {
        guard let tokenPayload = self.jwt?.payload else {
            return []
        }
        
        return NSArray(array: tokenPayload.map { ["PayloadKey": $0, "PayloadValue": $1] })
    }
    
    private func displayString(value: Any?, row: Int) -> String {
        if let stringValue = value as? String {
            return stringValue
        }
        
        if let booleanValue = value as? Bool {
            return String(booleanValue)
        }
        
        if let number = value as? Int {
            return isDateRow(row)
                ? iso8601Date(number)
                : String(number)
        }
        
        return value != nil ? "Complex Object" : "None"
    }
    
    private func isDateRow(_ row: Int) -> Bool {
        guard let payloadRow = getDataArray().object(at: row) as? [String: Any] else {
            return false
        }
        
        guard let payloadRowKey = payloadRow["PayloadKey"] as? String else {
            return false
        }
        
        switch payloadRowKey {
        case StandardJwtDateKeys.issuedAt.rawValue, StandardJwtDateKeys.expiry.rawValue:
            return true
        default:
            return false
        }
    }
    
    private func iso8601Date(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = ISO8601DateFormatter()
        
        return formatter.string(from: date)
    }
}

enum StandardJwtDateKeys: String {
    case issuedAt = "iat"
    case expiry = "exp"
}
