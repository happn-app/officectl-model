import Foundation

import Email



public struct DeleteUserQuery : Codable, Sendable {
	
	public var serviceIDs: [String]?
	
	init(serviceIDs: [String]? = nil) {
		self.serviceIDs = serviceIDs
	}
	
	enum CodingKeys : String, CodingKey {
		case serviceIDs = "service_ids"
	}
	
}
