//
//  Header.swift
//  Jot
//
//  Created by James Griffin-Allwood on 2018-12-29.
//  Copyright © 2018 James Griffin-Allwood. All rights reserved.
//

import Foundation

class Header: Codable {
    let alg: SigningAlgorithm
    let typ: JwtType
    
    init(alg: SigningAlgorithm, typ: JwtType) {
        self.alg = alg
        self.typ = typ
    }
}

enum JwtType: String, Codable {
    case jwt = "JWT"
}

enum SigningAlgorithm: String, Codable {
    case rsa256 = "RS256"
    case rsa384 = "RS384"
    case rsa512 = "RS512"
    case hmac256 = "HM256"
    case ecdsa256 = "ES256"
}
