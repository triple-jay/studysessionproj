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
    static func getSessions(completion: @escaping ([Session]) -> Void) {
        Alamofire.request(endpoint, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let sessionData = try? jsonDecoder.decode(SessionResponse.self, from: data as! Data) {
                    let sessions = sessionData.data.sessions
                    completion(sessions)
                }
            case .failure(let error):
                print(error)
        }
    }
}
}
