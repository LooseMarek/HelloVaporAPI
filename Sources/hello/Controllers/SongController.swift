//
//  SongController.swift
//  hello
//
//  Created by Marek Loose on 05/09/2025.
//

import Fluent
import Vapor

struct SongController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let songs = routes.grouped("songs")
        songs.get(use: index)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        Song.query(on: req.db).all()
    }
}
