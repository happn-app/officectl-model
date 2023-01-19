import Foundation

import LegibleError



public struct ApiError : Error, Codable, Sendable {
	
	public var message: String
	
	public init(message: String) {
		self.message = message
	}
	
}


extension ApiError {
	
	public init(error: Error) {
		self.init(message: error.legibleDescription)
	}
	
}
