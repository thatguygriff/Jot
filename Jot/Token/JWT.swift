//
//  JWT.swift
//  Jot
//
//  Created by James Griffin-Allwood on 2018-12-29.
//  Copyright © 2018 James Griffin-Allwood. All rights reserved.
//

import Foundation

class JWT {
    let header: Header
    let payload: Payload
    let signature: Signature
    
    init(header: Header, payload: Payload, signature: Signature) {
        self.header = header
        self.payload = payload
        self.signature = signature
    }
}
