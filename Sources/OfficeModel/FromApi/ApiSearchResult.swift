import Foundation



public struct ApiSearchResult<RequestType : Codable, ResultType : Codable> : Codable {
	
	public var request: RequestType
	public var errorsByServiceID: [String: ApiError]
	
	public var result: ResultType
	
	public init(request: RequestType, errorsByServiceID: [String : ApiError], result: ResultType) {
		self.request = request
		self.errorsByServiceID = errorsByServiceID
		self.result = result
	}
	
}

public typealias ApiUserSearchResult = ApiSearchResult<TaggedID, ApiUser>
public typealias ApiUsersSearchResult = ApiSearchResult<String, [ApiUser]>
