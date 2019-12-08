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
extension Session: Equatable {
    static func ==(lhs: Session, rhs: Session) -> Bool {
        return lhs.name == rhs.name && lhs.date == rhs.date && lhs.time == rhs.time && lhs.description == rhs.description && lhs.duration == rhs.duration && lhs.image == rhs.image && lhs.location == rhs.location
    }
}


struct SessionDataResponse: Codable {
    var sessions: [Session]
}

struct SessionResponse: Codable {
    var data: SessionDataResponse
}
