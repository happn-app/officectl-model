import Foundation



/**
 A wrapper for a property that is fetched on a remote source.
 
 There are three states possible for the */
@propertyWrapper
public enum RemoteProperty<Wrapped> {
	
	case set(Wrapped)
	case unset
	
	case unsupported
	
	public var wrappedValue: Wrapped? {
		get {
			switch self {
				case .set(let v):          return v
				case .unset, .unsupported: return nil
			}
		}
		set {
			switch self {
				case .unsupported: return
					
				case .set, .unset:
					if let wrappedValue = newValue {
						self = .set(wrappedValue)
					} else {
						self = .unset
					}
			}
		}
	}
	
	public init() {
		self = .unset
	}
	
	private enum CodingKeys : String, CodingKey {
		
		case state = "__HPN_officectl_RemoteProperty_state__value__"
		case value
		
	}
	
}


extension RemoteProperty : Sendable where Wrapped : Sendable {}


extension RemoteProperty : Decodable where Wrapped : Decodable {
	
	public init(from decoder: Decoder) throws {
		if let container = try? decoder.container(keyedBy: CodingKeys.self),
			let state = try? container.decode(String.self, forKey: .state)
		{
			switch state {
				case "set":         self = .set(try container.decode(Wrapped.self, forKey: .value))
				case "unset":       self = .unset
				case "unsupported": self = .unsupported
				default: throw DecodingError.dataCorruptedError(forKey: .state, in: container, debugDescription: "Invalid state \(state) for a remote property.")
			}
		} else {
			let container = try decoder.singleValueContainer()
			self = try .set(container.decode(Wrapped.self))
		}
	}
	
}


extension RemoteProperty : Encodable where Wrapped : Encodable {

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
			case .set(let v):
				try container.encode("set", forKey: .state)
				try container.encode(v,     forKey: .value)
				
			case .unset:
				try container.encode("unset", forKey: .state)
				
			case .unsupported:
				try container.encode("unsupported", forKey: .state)
		}
	}
	
}


extension KeyedDecodingContainer {
	
	public func decode<T : Decodable>(_ type: RemoteProperty<T>.Type, forKey key: Key) throws -> RemoteProperty<T> {
		return try decodeIfPresent(type, forKey: key) ?? .unset
	}
	
}


extension RemoteProperty : Equatable where Wrapped : Equatable {
	
	public static func ==(_ prop1: RemoteProperty<Wrapped>, _ prop2: RemoteProperty<Wrapped>) -> Bool {
		switch (prop1, prop2) {
			case (.set(let v1), .set(let v2)):                   return v1 == v2
			case (.unset, .unset), (.unsupported, .unsupported): return true
			case (.set, _), (.unset, _), (.unsupported, _):      return false
		}
	}
	
}


extension RemoteProperty : Hashable where Wrapped : Hashable {
	
	public func hash(into hasher: inout Hasher) {
		switch self {
			case .set(let v):  hasher.combine(0 as UInt8); hasher.combine(v)
			case .unset:       hasher.combine(1 as UInt8)
			case .unsupported: hasher.combine(2 as UInt8)
		}
	}
	
}


/* Conveniences when RemoteProperty is not used as a property wrapper. */
extension RemoteProperty {
	
	public func map<NewWrapped>(to type: NewWrapped.Type = NewWrapped.self, _ callback: (Wrapped) throws -> NewWrapped) rethrows -> RemoteProperty<NewWrapped> {
		switch self {
			case .unsupported: return .unsupported
			case .unset:       return .unset
			case .set(let v):  return try .set(callback(v))
		}
	}
	
}
