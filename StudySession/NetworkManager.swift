//
//  NetworkManager.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/14/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import Foundation
import Alamofire

let endpoint = "https://google.com" // Filler for JSON

class NetworkManager {
    static func getSessions() {
        Alamofire.request(endpoint, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
        }
    }
}
}
