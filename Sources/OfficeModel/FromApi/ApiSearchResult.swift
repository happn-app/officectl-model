import Foundation



public struct ApiSearchResult<RequestType : Codable, ResultType : Codable> : Codable {
	
	public var request: RequestType
	public var errorsByServiceId: [String: ApiError]
	
	public var result: ResultType
	
}

public typealias ApiUserSearchResult = ApiSearchResult<TaggedId, ApiUser>
public typealias ApiUsersSearchResult = ApiSearchResult<String, [ApiUser]>
