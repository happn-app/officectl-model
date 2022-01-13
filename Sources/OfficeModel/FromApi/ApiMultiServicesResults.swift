import Foundation



public struct ApiMultiServicesResults<Results : Codable, MergedResults : Codable> : Codable {
	
	
	/** The “raw” results by service IDs. */
	public var results: [String: ApiResult<Results>]
	/** The results merged in a single element. */
	public var mergedResults: MergedResults
	
	/** The service IDs that were queried. */
	public var serviceIDs: Set<String> { Set(results.keys) }
	/** Only the errors by service IDs. */
	public var errors: [String: ApiError] { results.compactMapValues{ $0.failure } }
	
	public init(serviceIDs: Set<String>, results: [String: ApiResult<Results>], mergedResults: MergedResults) {
		self.results = results
		self.mergedResults = mergedResults
	}
	
}

public typealias ApiUser = ApiMultiServicesResults<ApiDirectoryUser, ApiMergedUser>
public typealias ApiUsers = ApiMultiServicesResults<None, [ApiMergedUserWithSource]>
public typealias ApiPasswordReset = ApiMultiServicesResults<ApiDirectoryPasswordReset, ApiMergedPasswordReset>
