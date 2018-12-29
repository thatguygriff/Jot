//
//  JWT.swift
//  Jot
//
//  Created by James Griffin-Allwood on 2018-12-29.
//  Copyright © 2018 James Griffin-Allwood. All rights reserved.
//

import Foundation

class JWT {
    private let header: Header
    private let payload: Payload
    private let signature: Signature
    
    init(header: Header, payload: Payload, signature: Signature) {
        self.header = header
        self.payload = payload
        self.signature = signature
    }
    
    init?(token: String) {
        return nil
    }
}


