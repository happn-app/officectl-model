import Foundation



public struct ApiError : Error, Codable, Sendable {
	
	public var code: Int
	public var domain: String
	public var message: String
	
	public init(code c: Int, domain d: String, message m: String) {
		code = c
		domain = d
		message = m
	}
	
}
