import Foundation

import UnwrapOrThrow



public struct Tag : Sendable, Codable, Hashable, Equatable, RawRepresentable, LosslessStringConvertible, ExpressibleByStringLiteral {
	
	public typealias RawValue = String
	public typealias StringLiteralType = StaticString
	public typealias UnicodeScalarLiteralType = StaticString
	public typealias ExtendedGraphemeClusterLiteralType = StaticString
	
	public let value: String
	
	public init?<S : StringProtocol>(_ value: S) {
		guard !value.contains(":") else {
			return nil
		}
		self.value = String(value)
	}
	
	/* *************
	   MARK: Codable
	   ************* */
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.value = try container.decode(String.self)
		guard !value.contains(":") else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: "The value cannot contain a semicolon.")
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(value)
	}
	
	/* **********************
	   MARK: RawRepresentable
	   ********************** */
	
	public init?(rawValue: String) {
		self.init(rawValue)
	}
	
	public var rawValue: String {
		value
	}
	
	/* *******************************
	   MARK: LosslessStringConvertible
	   ******************************* */
	
	/* Unneeded because `init?<S : StringProtocol>(_ value: S)` takes care of it.
	 * Also, this particular implementation will cause an infinite recursion. */
//	public init?(_ description: String) {
//		self.init(description)
//	}
	
	public var description: String {
		value
	}
	
	/* ********************************
	   MARK: ExpressibleByStringLiteral
	   ******************************** */
	
	public init(stringLiteral value: StaticString) {
		self.init("\(value)")!
	}
	
	public init(unicodeScalarLiteral value: StaticString) {
		self.init("\(value)")!
	}
	
	public init(extendedGraphemeClusterLiteral value: StaticString){
		self.init("\(value)")!
	}
	
}


extension KeyedEncodingContainer {
	
	public mutating func encode<T : Encodable>(_ value: [Tag: T], forKey key: KeyedEncodingContainer<K>.Key) throws {
		try encode(Dictionary<String, T>(uniqueKeysWithValues: value.map{ ($0.key.rawValue, $0.value) }), forKey: key)
	}
	
}

extension UnkeyedEncodingContainer {
	
	public mutating func encode<T : Encodable>(_ value: [Tag: T]) throws {
		try encode(Dictionary<String, T>(uniqueKeysWithValues: value.map{ ($0.key.rawValue, $0.value) }))
	}
	
}

extension SingleValueEncodingContainer {
	
	public mutating func encode<T : Encodable>(_ value: [Tag: T]) throws {
		try encode(Dictionary<String, T>(uniqueKeysWithValues: value.map{ ($0.key.rawValue, $0.value) }))
	}
	
}


extension KeyedDecodingContainer {
	
	public func decode<T : Decodable>(_ type: [Tag: T].Type, forKey key: Key) throws -> [Tag: T] {
		let dic = try decode([String: T].self, forKey: key)
		return try Dictionary(uniqueKeysWithValues: dic.map{ keyVal in
			let tag = try Tag(keyVal.key) ?! DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Invalid tag found.")
			return (tag, keyVal.value)
		})
	}
	
}

extension UnkeyedDecodingContainer {
	
	public mutating func decode<T : Decodable>(_ type: [Tag: T].Type) throws -> [Tag: T] {
		let dic = try decode([String: T].self)
		return try Dictionary(uniqueKeysWithValues: dic.map{ keyVal in
			let tag = try Tag(keyVal.key) ?! DecodingError.dataCorruptedError(in: self, debugDescription: "Invalid tag found.")
			return (tag, keyVal.value)
		})
	}
	
}

extension SingleValueDecodingContainer {
	
	public func decode<T : Decodable>(_ type: [Tag: T].Type) throws -> [Tag: T] {
		let dic = try decode([String: T].self)
		return try Dictionary(uniqueKeysWithValues: dic.map{ keyVal in
			let tag = try Tag(keyVal.key) ?! DecodingError.dataCorruptedError(in: self, debugDescription: "Invalid tag found.")
			return (tag, keyVal.value)
		})
	}
	
}
