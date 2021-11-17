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

    app.get("ics-test") { req in
        req.redirect(
            to: "https://mfhosting.s3.amazonaws.com/test-method-publish.ics",
            type: .normal // 303 See Other
        )
    }
}
