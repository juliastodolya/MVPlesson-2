//
//  Person.swift
//  MVPlesson
//
//  Created by Юлия on 21.02.2021.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
