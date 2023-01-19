import Foundation



public struct ApiError : Error, Codable, Sendable {
	
	public var message: String
	
	public init(message: String) {
		self.message = message
	}
	
}
