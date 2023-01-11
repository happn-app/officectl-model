import Foundation



public struct ApiService : Codable, Sendable {
	
	public var providerID: String
	
	public var serviceID: String
	public var serviceFullName: String
	
	public init(providerID: String, serviceID: String, serviceFullName: String) {
		self.providerID = providerID
		self.serviceID = serviceID
		self.serviceFullName = serviceFullName
	}
	
}
