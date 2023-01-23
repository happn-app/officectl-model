import Foundation

import UnwrapOrThrow

import OfficeModelCore



public struct ApiMultiServicesID : Sendable, Codable {
	
	public var ids: [Tag: String]
	
	public init(ids: [Tag: String]) {
		self.ids = ids
	}
	
	/* If two or more tagged ID have the same tag, the last ID will win. */
	public init(taggedIDs: [TaggedID]) {
		self.ids = Dictionary(taggedIDs.map{ ($0.tag, $0.id) }, uniquingKeysWith: { _, new in new })
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let dic = try container.decode([String: String].self)
		self.ids = try Dictionary(uniqueKeysWithValues: dic.map{ keyVal in
			let tag = try Tag(keyVal.key) ?! DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid tag found.")
			return (tag, keyVal.value)
		})
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(Dictionary(uniqueKeysWithValues: ids.map{ ($0.key.rawValue, $0.value) }))
	}
	
}


extension ApiMultiServicesID {
	
	public var taggedIDs: [TaggedID] {
		return ids.map{ TaggedID(tag: $0.key, id: $0.value) }
	}
	
}
