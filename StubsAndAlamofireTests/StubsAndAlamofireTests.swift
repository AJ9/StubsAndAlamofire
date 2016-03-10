//
//  StubsAndAlamofireTests.swift
//  StubsAndAlamofireTests
//
//  Created by Adam Gask on 09/03/2016.
//  Copyright © 2016 AJ9. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import StubsAndAlamofire

class StubsAndAlamofireTests: XCTestCase {
    
    var httpClient: HTTPClient!
    let asyncTimeout = NSTimeInterval(10.0)
    let request = NSURLRequest(URL: NSURL(string: "https://www.google.co.uk/")!)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        httpClient = HTTPClient()
        httpClient = HTTPClient()
        OHHTTPStubs.setEnabled(true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        httpClient = nil
        OHHTTPStubs.removeAllStubs()
        OHHTTPStubs.setEnabled(false)
        super.tearDown()
    }
    
    func testNilDataStub() {
        
        let expectation = expectationWithDescription("Make a HTTPRequest which returns a 200 with no data.")
        
        let expectedStatusCode = 200
        
        stub(isHost(request.URL!.host!)) { _ in
            let response = OHHTTPStubsResponse()
            response.statusCode = Int32(expectedStatusCode)
            return response
        }
        
        httpClient.makeHTTPRequest(request, completionHandler: { result in
            
            XCTAssertNil(result)
            
            expectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(asyncTimeout) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
