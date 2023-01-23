import Foundation

import OfficeModelCore



public struct ApiMultiServicesID : Sendable, Codable {
	
	public var ids: [String: String]
	
	public init(ids: [String: String]) {
		self.ids = ids
	}
	
	/* If two or more tagged ID have the same tag, the last ID will win. */
	public init(taggedIDs: [TaggedID]) {
		self.ids = Dictionary(taggedIDs.map{ ($0.tag, $0.id) }, uniquingKeysWith: { _, new in new })
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.ids = try container.decode([String: String].self)
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(ids)
	}
	
}


extension ApiMultiServicesID {
	
	public var taggedIDs: [TaggedID] {
		return ids.map{ TaggedID(tag: $0.key, id: $0.value)! }
	}
	
}
