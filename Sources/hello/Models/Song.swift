//
//  Song.swift
//  hello
//
//  Created by Marek Loose on 05/09/2025.
//

import Fluent
import Vapor

final class Song: Model, Content, @unchecked Sendable {
    static let schema = "songs"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
