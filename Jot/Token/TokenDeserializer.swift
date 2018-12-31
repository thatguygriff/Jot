//
//  TokenDeserializer.swift
//  Jot
//
//  Created by James Griffin-Allwood on 2018-12-29.
//  Copyright © 2018 James Griffin-Allwood. All rights reserved.
//

import Foundation
import os.log

extension Jwt {
    convenience init?(token: String) {
        let decoder = JSONDecoder()
        let jwtParts = token.split(separator: ".")
        guard jwtParts.count == 3 else {
            os_log("Invalid JWT format. Requires 3 parts", log: OSLog.default, type: .error)
            return nil
        }
        
        let base64Header = String(jwtParts[0])
        guard let headerData = Data(base64Encoded: base64Header.base64Pad()) else {
            os_log("Header must be Base64 Encoded", log: OSLog.default, type: .error)
            return nil
        }
        
        
        let base64Payload = String(jwtParts[1])
        guard let payloadData = Data(base64Encoded: base64Payload.base64Pad()) else {
            os_log("Payload must be Base64 Encoded", log: OSLog.default, type: .error)
            return nil
        }
        
        // TODO: Base64 Decoding the signature fails. Leave alone until adding Token Validation
        // let base64Signature = String(jwtParts[2])
        // guard let signatureData = Data(base64Encoded: base64Signature.base64Pad()) else {
        //     os_log("Signature must be Base64 Encoded", log: OSLog.default, type: .error)
        //     return nil
        // }
        
        do {
            let header = try decoder.decode(Header.self, from: headerData)
            let payload = try JSONSerialization.jsonObject(with: payloadData) as? Payload ?? [:]
            let signature = Signature()
            self.init(header: header, payload: payload, signature: signature)
        } catch {
            os_log("Unable to deserialize JWT: %@", log: OSLog.default, type: .error, error.localizedDescription)
            return nil
        }
    }
}

extension String {
    func base64Pad() -> String {
        var paddedString = self
        if self.count % 4 != 0 {
            let charactersToAdd = 4 - self.count % 4
            paddedString.append(contentsOf: repeatElement("=", count: charactersToAdd))
        }
        return paddedString
    }
}
