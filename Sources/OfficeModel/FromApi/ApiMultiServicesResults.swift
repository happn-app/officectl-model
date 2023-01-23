import Foundation



extension ApiMultiServicesResults : Sendable where Results : Sendable, MergedResults : Sendable {}
public struct ApiMultiServicesResults<MergedResults : Codable, Results : Codable> : Codable {
	
	/** The results merged in a single element. */
	public var mergedResults: MergedResults
	/** The “raw” results by service IDs. */
	public var results: [Tag: Result<Results, ApiError>]
	
	public init(mergedResults: MergedResults, results: [Tag: Result<Results, ApiError>]) {
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
	public var serviceIDs: Set<Tag> {
		Set(results.keys)
	}
	
	/** Only the errors by service IDs. */
	public var errors: [Tag: ApiError] {
		results.compactMapValues{ $0.failure }
	}
	
}
