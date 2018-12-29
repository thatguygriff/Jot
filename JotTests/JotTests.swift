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
    var jwt: JWT?

    override func setUp() {
        self.jwt = JWT(token: "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ3JpZmZpbiIsIm5hbWUiOiJKYW1lcyBHcmlmZmluIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.DXfNW7Gzvie7LIl5-HSG9clm3sjeglYG2uNmsPvcNerBQbzLI06vys4YqqCMtrWKEFij_y2hKGP9YFdHSRMdtyVcGEXmYP6H6E62uGhASmGFzEHeSa6B1X1-v8lRt_YpIGEXhkUnxfhdcQ90HJlNfajv0ndnRFk8YJxRkmr99OI")
    }

    func testJWTInit() {
        XCTAssertNotNil(self.jwt)
    }
}
