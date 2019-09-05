// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "statium-backend",
    products: [
        .library(name: "statium-backend", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on Postgres.
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentPostgreSQL", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
