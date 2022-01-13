import Foundation



public enum ApiResult<Success : Codable> : Codable {
	
	case success(Success)
	case failure(ApiError)
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		if let success = try? container.decode(Success.self, forKey: .success) {
			guard !container.contains(.failure) || (try? container.decodeNil(forKey: .failure)) ?? false else {
				throw DecodingError.dataCorruptedError(forKey: .success, in: container, debugDescription: "Encoded ApiResult has a valid success value, but also has a non-nil failure value. This is not allowed.")
			}
			self = .success(success)
		} else if let failure = try? container.decode(ApiError.self, forKey: .failure) {
			guard !container.contains(.success) || (try? container.decodeNil(forKey: .success)) ?? false else {
				throw DecodingError.dataCorruptedError(forKey: .success, in: container, debugDescription: "Encoded ApiResult has a valid failure value, but also has a non-nil sucess value. This is not allowed.")
			}
			self = .failure(failure)
		} else {
			throw DecodingError.dataCorruptedError(forKey: container.contains(.success) ? .success : .failure, in: container, debugDescription: "Encoded ApiResult does not have a valid success or failure value.")
		}
	}
	
	/* Swift has default Codable conformance for enum, even w/ associated values, but it’s too verbose for our purpose. */
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
			case .success(let s): try container.encode(s, forKey: .success)
			case .failure(let f): try container.encode(f, forKey: .failure)
		}
	}
	
	public var value: Success? {
		switch self {
			case .success(let s): return s
			case .failure:        return nil
		}
	}
	
	public var failure: ApiError? {
		switch self {
			case .success:        return nil
			case .failure(let f): return f
		}
	}
	
	private enum CodingKeys : String, CodingKey {
		case success, failure
	}
	
}
