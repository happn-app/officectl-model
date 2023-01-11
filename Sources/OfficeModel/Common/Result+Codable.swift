import Foundation



extension Result : Codable where Success : Codable, Failure : Codable {
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		if let success = try container.decodeIfPresent(Success.self, forKey: .success) {
			guard try container.decodeIfPresent(Failure.self, forKey: .failure) == nil else {
				throw DecodingError.dataCorruptedError(forKey: .success, in: container, debugDescription: "The failure key should be absent for a Result when the success key is present.")
			}
			self = .success(success)
		} else {
			self = .failure(try container.decode(Failure.self, forKey: .failure))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
			case let .success(s): try container.encode(s, forKey: .success)
			case let .failure(f): try container.encode(f, forKey: .failure)
		}
	}
	
	private enum CodingKeys : String, CodingKey {
		
		case success
		case failure
		
	}
	
}
