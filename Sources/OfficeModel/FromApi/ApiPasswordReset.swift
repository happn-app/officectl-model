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
	
//	public init(requestedUserId uid: TaggedId, multiPasswordResets: MultiServicesPasswordReset, environment: Environment) {
//		requestedUserId = uid
//		fetchErrorsByServiceId = multiPasswordResets.errorsByServiceId.mapValues{ ApiError(error: $0, environment: environment) }
//
//		isExecuting = multiPasswordResets.isExecuting
//		serviceResets = multiPasswordResets.itemsByServiceId.mapValues{ resetPair in
//			resetPair.flatMap{ ApiServicePasswordReset(passwordResetPair: $0, environment: environment) }
//		}
//	}
	
}
