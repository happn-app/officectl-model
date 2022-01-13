import Foundation



/** The structure representing a password reset for a single user on a single directory. */
public struct ApiDirectoryPasswordReset : Codable {
	
	public enum Status : Codable {
		
		case idle
		case running
		case ranRecently(error: ApiError?)
		
	}
	
	public var serviceID: String
	public var userID: String
	
	public var status: Status
	
	public init(serviceID: String, userID: String, status: Status) {
		self.serviceID = serviceID
		self.userID = userID
		self.status = status
	}
	
}
