import Foundation



/** The structure representing a password reset for a single user on a single service. */
public struct ApiServicePasswordReset : Codable {
	
	public var userID: String?
	
	public var hasRun: Bool
	public var isExecuting: Bool
	public var error: ApiError?
	
	public init(userID: String? = nil, hasRun: Bool, isExecuting: Bool, error: ApiError? = nil) {
		self.userID = userID
		self.hasRun = hasRun
		self.isExecuting = isExecuting
		self.error = error
	}
	
}
