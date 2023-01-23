import Foundation

import UnwrapOrThrow



/**
 A `TaggedID` is simple an ID with a “namespace” (e.g. “email:a@example.com”, the tag is “email”, the ID is “a@example.com”).
 
 The tag **cannot** contain a colon, because we do not escape the tag (I am so lazy). */
public struct TaggedID : Sendable, Hashable, LosslessStringConvertible {
	
	public var tag: Tag
	public var id: String
	
	public init?(_ str: String) {
		let split = str.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false)
		assert(split.count == 1 || split.count == 2)
		
		let ts = String(split[0]) /* We do not omit empty subsequences, thus we know there will be at min 1 elmt in the resulting array */
		let id = String(split.dropFirst().first ?? "")
		
		guard let t = Tag(ts) else {return nil}
		self.init(tag: t, id: id)
	}
	
	public init(tag: Tag, id: String) {
		self.tag = tag
		self.id = id
	}
	
	public var stringValue: String {
		return "\(tag):\(id)"
	}
	
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
