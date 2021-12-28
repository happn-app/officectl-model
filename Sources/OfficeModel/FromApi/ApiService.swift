import Foundation



public struct ApiService : Codable {
	
	public var providerId: String
	
	public var serviceId: String
	public var serviceFullName: String
	
	public var isHelperService: Bool
	
}
