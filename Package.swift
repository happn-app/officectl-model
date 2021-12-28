// swift-tools-version:5.5
import PackageDescription


let package = Package(
	name: "OfficeModel",
	products: [
		.library(name: "OfficeModel", targets: ["OfficeModel"])
	],
	dependencies: [
		.package(url: "https://github.com/Frizlab/swift-email.git", from: "0.2.1"),
		.package(url: "https://github.com/Frizlab/UnwrapOrThrow.git", from: "1.0.0-beta"),
		.package(url: "https://github.com/zoul/generic-json-swift.git", from: "2.0.1")
	],
	targets: [
		.target(
			name: "OfficeModel",
			dependencies: [
				.product(name: "Email",         package: "swift-email"),
				.product(name: "GenericJSON",   package: "generic-json-swift"),
				.product(name: "UnwrapOrThrow", package: "UnwrapOrThrow")
			],
			swiftSettings: [
				.unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
				.unsafeFlags(["-Xfrontend", "-warn-concurrency", "-Xfrontend", "-enable-actor-data-race-checks"])
			]
		)
	]
)
