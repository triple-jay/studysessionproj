//
//  Session.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/14/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import Foundation

struct Session: Codable {
    var name: String
    var date: String
    var time: String
    var description: String
    var duration: Int
    var image: String //Data
    var location: String
//    var like: Bool  = false
}

struct SessionDataResponse: Codable {
    var study_groups: [Session]
}

struct SessionResponse: Codable {
    var data: SessionDataResponse
}
