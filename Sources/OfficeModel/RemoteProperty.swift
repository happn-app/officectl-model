import Foundation



/**
 A wrapper for a property that is fetched on a remote source.
 
 There are three states possible for the */
@propertyWrapper
public enum RemoteProperty<T> {
	
	case set(T)
	case unset
	
	case unsupported
	
	public var wrappedValue: T? {
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
	
}


extension RemoteProperty : Codable where T : Codable {
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let state = try container.decode(String.self, forKey: .state)
		switch state {
			case "set":         self = .set(try container.decode(T.self, forKey: .value))
			case "unset":       self = .unset
			case "unsupported": self = .unsupported
			default: throw DecodingError.dataCorruptedError(forKey: .state, in: container, debugDescription: "Invalid state \(state) for a remote property.")
		}
	}
	
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
	
	private enum CodingKeys : String, CodingKey {
		
		case state
		case value
		
	}
	
}


extension KeyedEncodingContainer {
	
	mutating func encodeIfSet<T>(_ value: RemoteProperty<T>, forKey key: K) throws where T : Encodable {
		switch value {
			case .set(let v):          try encode(v, forKey: key)
			case .unset, .unsupported: (/*nop*/)
		}
	}
	
}


extension RemoteProperty : Equatable where T : Equatable {
	
	public static func ==(_ prop1: RemoteProperty<T>, _ prop2: RemoteProperty<T>) -> Bool {
		switch (prop1, prop2) {
			case (.set(let v1), .set(let v2)):                   return v1 == v2
			case (.unset, .unset), (.unsupported, .unsupported): return true
			case (.set, _), (.unset, _), (.unsupported, _):      return false
		}
	}
	
}


extension RemoteProperty : Hashable where T : Hashable {
	
	public func hash(into hasher: inout Hasher) {
		switch self {
			case .set(let v):  hasher.combine(0 as UInt8); hasher.combine(v)
			case .unset:       hasher.combine(1 as UInt8)
			case .unsupported: hasher.combine(2 as UInt8)
		}
	}
	
}

