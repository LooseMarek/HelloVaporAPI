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
        songs.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        Song.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let song = try req.content.decode(Song.self)
        return song.save(on: req.db).transform(to: .ok)
    }
}
