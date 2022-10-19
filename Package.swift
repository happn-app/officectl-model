// swift-tools-version:5.7
import PackageDescription



let commonSwiftSettings: [SwiftSetting] = [
	.unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
	//	.unsafeFlags(["-Xfrontend", "-warn-concurrency", "-Xfrontend", "-enable-actor-data-race-checks"])
]


let package = Package(
	name: "OfficeModel",
	platforms: [
		.macOS(.v12)
	],
	products: {
		var ret = [Product]()
		ret.append(.library(name: "OfficeModelCore", targets: ["Core"]))
		ret.append(.library(name: "OfficeModel", targets: ["OfficeModel", "Core"]))
		return ret
	}(),
	dependencies: {
		var ret = [Package.Dependency]()
		ret.append(.package(url: "https://github.com/Frizlab/swift-email.git", from: "0.2.1"))
		ret.append(.package(url: "https://github.com/Frizlab/UnwrapOrThrow.git", from: "1.0.0-beta"))
		ret.append(.package(url: "https://github.com/iwill/generic-json-swift.git", from: "2.0.1"))
		return ret
	}(),
	targets: {
		var ret = [Target]()
		ret.append(.target(name: "Core", swiftSettings: commonSwiftSettings))
		ret.append(.target(
			name: "OfficeModel",
			dependencies: {
				var ret = [Target.Dependency]()
				ret.append(.product(name: "Email",         package: "swift-email"))
				ret.append(.product(name: "GenericJSON",   package: "generic-json-swift"))
				ret.append(.product(name: "UnwrapOrThrow", package: "UnwrapOrThrow"))
				ret.append(.target(name: "Core"))
				return ret
			}(),
			swiftSettings: commonSwiftSettings
		))
		return ret
	}()
)
