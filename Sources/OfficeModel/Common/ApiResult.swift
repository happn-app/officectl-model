import Foundation



public enum ApiResult<Success : Codable> : Codable {
	
	case success(Success)
	case failure(ApiError)
	
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
	
}
