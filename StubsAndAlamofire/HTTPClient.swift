//
//  HTTPClient.swift
//  StubsAndAlamofire
//
//  Created by Adam Gask on 09/03/2016.
//  Copyright © 2016 AJ9. All rights reserved.
//

import UIKit
import Alamofire

internal typealias HTTPClientCompletionHandler = (NSData?) -> Void

class HTTPClient: NSObject {
    /**
     Make and handle a HTTP Request.
     
     - parameter request:           The request to be passed to a HTTP Client.
     - parameter completionHandler: The completion handler from the requestee.
     */
    func makeHTTPRequest(request: NSURLRequest, completionHandler: HTTPClientCompletionHandler) {
        print("Requesting - \(request.HTTPMethod!) \(request.URL!.absoluteString)")
        Alamofire
            .request(request)
            .response { _, _, data, _ in
                completionHandler(data)
        }
    }
}
