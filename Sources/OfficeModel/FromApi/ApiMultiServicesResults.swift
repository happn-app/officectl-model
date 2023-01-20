import Foundation



extension ApiMultiServicesResults : Sendable where Results : Sendable, MergedResults : Sendable {}
public struct ApiMultiServicesResults<MergedResults : Codable, Results : Codable> : Codable {
	
	/** The results merged in a single element. */
	public var mergedResults: MergedResults
	/** The “raw” results by service IDs. */
	public var results: [String: Result<Results, ApiError>]
	
	public init(mergedResults: MergedResults, results: [String: Result<Results, ApiError>]) {
		self.mergedResults = mergedResults
		self.results = results
	}
	
	public enum CodingKeys : String, CodingKey {
		case results
		case mergedResults = "merged_results"
	}
	
}


extension ApiMultiServicesResults {
	
	/** The service IDs that were queried. */
	public var serviceIDs: Set<String> {
		Set(results.keys)
	}
	
	/** Only the errors by service IDs. */
	public var errors: [String: ApiError] {
		results.compactMapValues{ $0.failure }
	}
	
}
