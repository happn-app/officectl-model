import Foundation

import OfficeModelCore



public struct ApiMultiServicesID : Sendable, Codable {
	
	public var ids: [String: String]
	
}


extension ApiMultiServicesID {
	
	public var taggedIDs: [TaggedID] {
		return ids.map{ TaggedID(tag: $0.key, id: $0.value) }
	}
	
}
