import Foundation



/** The structure representing a password reset for a single user on a single service. */
public struct ApiServicePasswordReset : Codable {
	
	public var userId: String?
	
	public var hasRun: Bool
	public var isExecuting: Bool
	public var error: ApiError?
	
	public init(userId: String? = nil, hasRun: Bool, isExecuting: Bool, error: ApiError? = nil) {
		self.userId = userId
		self.hasRun = hasRun
		self.isExecuting = isExecuting
		self.error = error
	}
	
}
