//
//  NetworkManager.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/14/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import Foundation
import Alamofire

let endpoint = "http://35.196.63.243/api/study_groups" // Filler for JSON

class NetworkManager {
    static func getSessions(completion: @escaping ([Session]) -> Void) {
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case.success(let data):
                let jsonDecoder = JSONDecoder()
                if let sessionResponse = try? jsonDecoder.decode(SessionResponse.self, from: data){
                    let sessions = sessionResponse.data.study_groups
                    completion(sessions)
                } else{
                    print("Invalid Data")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
        }
    }
}
    static func postSessions(object: Session) {
        let parameters: [String: Any] = [
            "name": object.name,
            "date": object.date,
            "time": object.time,
            "description": object.description,
            "duration": object.duration,
            "image": object.image,
            "location": object.location
        ]
        Alamofire.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case.success(let data):
                let jsonDecoder = JSONDecoder()
                if let sessionResponse = try? jsonDecoder.decode(SessionResponse.self, from: data){
                    let sessions = sessionResponse.data.study_groups
//                    return(sessions, nil)
                } else{
                    print("Invalid Data")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
        }
    }
    }
}
