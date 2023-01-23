import Foundation



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
