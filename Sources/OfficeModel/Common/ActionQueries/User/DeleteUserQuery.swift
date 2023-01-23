import Foundation

import Email



public struct DeleteUserQuery : Codable, Sendable {
	
	public var serviceIDs: [Tag]?
	
	init(serviceIDs: [Tag]? = nil) {
		self.serviceIDs = serviceIDs
	}
	
	public enum CodingKeys : String, CodingKey {
		case serviceIDs = "service_ids"
	}
	
}
