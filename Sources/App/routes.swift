import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        req.view.render("index", ["title": "Hello Vapor!"])
    }
    app.get { _ in
        "It works!"
    }

    app.get("hello") { _ -> String in
        "Hello, world!"
    }

    app.get("ics-test") { _ in
        FoundWrapper(location: "https://mfhosting.s3.amazonaws.com/test-method-publish.ics")
    }
}

struct FoundWrapper {
    let location: String
}

extension FoundWrapper: ResponseEncodable {
    public func encodeResponse(for request: Request)
        -> EventLoopFuture<Response> {
        var headers = HTTPHeaders()
        headers.add(name: .location, value: location)
        return request.eventLoop.makeSucceededFuture(.init(
            status: .found, headers: headers
        ))
    }
}
