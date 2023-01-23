import Foundation

import UnwrapOrThrow



/**
 A `TaggedID` is simple an ID with a “namespace” (e.g. “email:a@example.com”, the tag is “email”, the ID is “a@example.com”).
 
 The tag **cannot** contain a colon, because we do not escape the tag (I am so lazy). */
public struct TaggedID : LosslessStringConvertible {
	
	public let tag: String
	public var id: String
	
	public init?(_ str: String) {
		let split = str.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false)
		assert(split.count == 1 || split.count == 2)
		
		let t = String(split[0]) /* We do not omit empty subsequences, thus we know there will be at min 1 elmt in the resulting array */
		let i = String(split.dropFirst().first ?? "")
		
		self.init(tag: t, id: i)
	}
	
	public init?(tag: String, id: String) {
		guard !tag.contains(":") else {
			return nil
		}
		
		self.tag = tag
		self.id = id
	}
	
	public var stringValue: String {
		return tag + ":" + id
	}
	
	public func changingTag(_ newTag: String) -> TaggedID? {
		return TaggedID(tag: newTag, id: id)
	}
	
}


extension TaggedID : Sendable {}


extension TaggedID : Hashable {
}


extension TaggedID : CustomStringConvertible {
	
	public var description: String {
		return stringValue
	}
	
}


extension TaggedID : RawRepresentable {
	
	public typealias RawValue = String
	
	public init?(rawValue: String) {
		self.init(rawValue)
	}
	
	public var rawValue: String {
		return stringValue
	}
	
}


extension TaggedID : Codable {
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self = try Self(container.decode(String.self)) ?! DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid tagged id.")
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(stringValue)
	}
	
}
