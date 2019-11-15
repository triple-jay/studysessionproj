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
    var date: Date
    var time: Date
    var description: String
    var image: String
}

struct SessionDataResponse: Codable {
    var sessions: [Session]
}

struct SessionResponse: Codable {
    var data: SessionDataResponse
}
