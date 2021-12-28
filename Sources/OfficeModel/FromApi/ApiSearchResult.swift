import Foundation



public struct ApiSearchResult<RequestType : Codable, ResultType : Codable> : Codable {
	
	public var request: RequestType
	public var errorsByServiceId: [String: ApiError]
	
	public var result: ResultType
	
}

typealias ApiUserSearchResult = ApiSearchResult<TaggedId, ApiUser>
typealias ApiUsersSearchResult = ApiSearchResult<String, [ApiUser]>
