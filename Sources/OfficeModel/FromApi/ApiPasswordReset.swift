import Foundation



/** The structure representing a password reset for a single user, accross many services. */
public struct ApiPasswordReset : Codable {
	
	public var requestedUserID: TaggedID
	public var fetchErrorsByServiceID: [String: ApiError]
	
	public var isExecuting: Bool
	public var serviceResets: [String: ApiServicePasswordReset?]
	
	public init(requestedUserID: TaggedID, fetchErrorsByServiceID: [String : ApiError], isExecuting: Bool, serviceResets: [String : ApiServicePasswordReset?]) {
		self.requestedUserID = requestedUserID
		self.fetchErrorsByServiceID = fetchErrorsByServiceID
		self.isExecuting = isExecuting
		self.serviceResets = serviceResets
	}
	
}
