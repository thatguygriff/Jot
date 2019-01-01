//
//  JotTests.swift
//  JotTests
//
//  Created by James Griffin-Allwood on 2018-12-29.
//  Copyright © 2018 James Griffin-Allwood. All rights reserved.
//

import XCTest
@testable import Jot

class JotTests: XCTestCase {

    func testJWTInit() {
        guard let jwt = Jwt(token:  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ3JpZmZpbiIsIm5hbWUiOiJKYW1lcyBHcmlmZmluIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.DXfNW7Gzvie7LIl5-HSG9clm3sjeglYG2uNmsPvcNerBQbzLI06vys4YqqCMtrWKEFij_y2hKGP9YFdHSRMdtyVcGEXmYP6H6E62uGhASmGFzEHeSa6B1X1-v8lRt_YpIGEXhkUnxfhdcQ90HJlNfajv0ndnRFk8YJxRkmr99OI") else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(jwt.header.alg, SigningAlgorithm.rsa256)
        XCTAssertEqual(jwt.header.typ, JwtType.jwt)
    }
    
    func testJWTPayload() {
        guard let jwt = Jwt(token:  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ3JpZmZpbiIsIm5hbWUiOiJKYW1lcyBHcmlmZmluIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.DXfNW7Gzvie7LIl5-HSG9clm3sjeglYG2uNmsPvcNerBQbzLI06vys4YqqCMtrWKEFij_y2hKGP9YFdHSRMdtyVcGEXmYP6H6E62uGhASmGFzEHeSa6B1X1-v8lRt_YpIGEXhkUnxfhdcQ90HJlNfajv0ndnRFk8YJxRkmr99OI") else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(jwt.payload["sub"] as? String, "jgriffin")
        XCTAssertEqual(jwt.payload["name"] as? String, "James Griffin")
    }
    
    func testJwtPayloadWithComplexObject() {
        guard let jwt = Jwt(token: "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ3JpZmZpbiIsIm5hbWUiOiJKYW1lcyBHcmlmZmluIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoxNTY2MjM5MDIyLCJsaWMiOjIsInJvbGVzIjpbeyJ0eXBlIjoiQWRtaW4ifV19.W9xUEhfgQSZivmmcW_egcP3AR3QG7CTXo-1x-7NXgqdTxY9tDMcbVRvFuBj-qRcoh-Ugl-IHeQgSaUnxAfOwnHicWmRr5d44YO_MuuT7RYOPBImN2zg9CoYdrdIzbLkLo6m5muR5d8xs3lgRzhDneLCDKE4BfdDYqbMSkO4INWY") else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(jwt.payload["exp"] as? Int, 1566239022)
        
        guard let roles = jwt.payload["roles"] as? [[String:String]] else {
            XCTFail()
            return
        }
        XCTAssertEqual(roles.first!["type"], "Admin")
    }
    
}
