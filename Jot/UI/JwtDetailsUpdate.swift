//
//  JwtDetailsUpdate.swift
//  Jot
//
//  Created by James Griffin-Allwood on 2019-01-01.
//  Copyright © 2019 James Griffin-Allwood. All rights reserved.
//

import Foundation
import Cocoa
import os.log

extension JwtDetailsViewController: NSTextStorageDelegate {
    func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorageEditActions, range editedRange: NSRange, changeInLength delta: Int) {
        guard textStorage.string.count > 0 else {
            return
        }
        
        guard let token = Jwt(token: textStorage.string) else {
            os_log("%@ is not a valid JWT Token", log: OSLog.default, type: .error, textStorage.string)
            return
        }
        
        self.jwt = token
        
        jwtAlgOutput.stringValue = token.header.alg.rawValue
        jwtTypOutput.stringValue = token.header.typ.rawValue
        jwtDetailsTable.reloadData()
    }
}
