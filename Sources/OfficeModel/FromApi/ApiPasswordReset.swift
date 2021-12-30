import Foundation



/** The structure representing a password reset for a single user, accross many services. */
public struct ApiPasswordReset : Codable {
	
	public var requestedUserId: TaggedId
	public var fetchErrorsByServiceId: [String: ApiError]
	
	public var isExecuting: Bool
	public var serviceResets: [String: ApiServicePasswordReset?]
	
	public init(requestedUserId: TaggedId, fetchErrorsByServiceId: [String : ApiError], isExecuting: Bool, serviceResets: [String : ApiServicePasswordReset?]) {
		self.requestedUserId = requestedUserId
		self.fetchErrorsByServiceId = fetchErrorsByServiceId
		self.isExecuting = isExecuting
		self.serviceResets = serviceResets
	}
	
}
