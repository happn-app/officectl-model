import Foundation



public enum ApiActionStatus : Codable, Sendable {
	
	case idle
	case running
	case ranRecently(error: ApiError?)
	
}
