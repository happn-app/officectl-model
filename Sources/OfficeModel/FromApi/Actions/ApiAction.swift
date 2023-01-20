import Foundation



public struct ApiAction<Query : Codable & Sendable> : Codable, Sendable {
	
	public var ids: ApiMultiServicesID
	public var statusByService: [String: ApiActionStatus]
	
	public var query: Query
	
	public init(ids: ApiMultiServicesID, statusByService: [String: ApiActionStatus], query: Query) {
		self.ids = ids
		self.statusByService = statusByService
		self.query = query
	}
	
	public enum CodingKeys : String, CodingKey {
		case ids
		case statusByService = "status_by_service"
		
		case query
	}
	
}
