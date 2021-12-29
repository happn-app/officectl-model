import Foundation



public struct ApiService : Codable {
	
	public var providerId: String
	
	public var serviceId: String
	public var serviceFullName: String
	
	public var isHelperService: Bool
	
	public init(providerId: String, serviceId: String, serviceFullName: String, isHelperService: Bool) {
		self.providerId = providerId
		self.serviceId = serviceId
		self.serviceFullName = serviceFullName
		self.isHelperService = isHelperService
	}
	
}
