//
//  CreateSongs.swift
//  hello
//
//  Created by Marek Loose on 05/09/2025.
//

import Fluent

struct CreateSongs: Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("songs")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("songs")
            .delete()
    }
}
