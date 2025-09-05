import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }
    
    app.get("hello") { req async -> String in
        "Hello, World!"
    }

    app.get("hello", ":name") { req async -> String in
        let name = req.parameters.get("name") ?? "World"
        return "Hello, \(name)!"
    }
    
    app.get("number", ":x") { req -> String in
        guard let int = req.parameters.get("x", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(int) is a great number"
    }
    
    let users = app.grouped("users")
    
    // GET /users
    users.get { req in
        ""
    }
    
    // POST /users
    users.post { req in
        ""
    }
    
    // GET /users/:id
    users.get(":id") { req in
        let id = req.parameters.get("id")!
        return ""
    }
    
    try app.register(collection: SongController())
}
