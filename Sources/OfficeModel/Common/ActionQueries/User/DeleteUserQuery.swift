import Foundation

import Email



public struct DeleteUserQuery : Codable, Sendable {
	
	public var serviceIDs: [String]?
	
	init(serviceIDs: [String]? = nil) {
		self.serviceIDs = serviceIDs
	}
	
	public enum CodingKeys : String, CodingKey {
		case serviceIDs = "service_ids"
	}
	
}
