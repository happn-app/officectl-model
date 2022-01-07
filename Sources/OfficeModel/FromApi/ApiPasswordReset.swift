import Foundation



/** The structure representing a password reset for a single user, accross many services. */
public struct ApiPasswordReset : Codable {
	
	public var requestedUserID: TaggedID
	
	/** `true` if at least one reset is in the `running` state. */
	public var isExecuting: Bool
	/**
	 Keys are service IDs.
	 Service IDs of services that do not support a password reset are not in this dictionary. */
	public var serviceResets: [String: ApiResult<ApiServicePasswordReset>]
	
	public init(requestedUserID: TaggedID, isExecuting: Bool, serviceResets: [String: ApiResult<ApiServicePasswordReset>]) {
		self.requestedUserID = requestedUserID
		self.isExecuting = isExecuting
		self.serviceResets = serviceResets
	}
	
}
