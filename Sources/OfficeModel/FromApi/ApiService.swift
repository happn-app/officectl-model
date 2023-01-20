import Foundation



public struct ApiService : Codable, Sendable {
	
	public var providerID: String
	
	public var serviceID: String
	public var serviceFullName: String
	
	public var isAuthService: Bool
	public var isUserService: Bool
	public var isGroupOfUsersService: Bool
	
	public init(
		providerID: String,
		serviceID: String, serviceFullName: String,
		isAuthService: Bool, isUserService: Bool, isGroupOfUsersService: Bool
	) {
		self.providerID = providerID
		
		self.serviceID = serviceID
		self.serviceFullName = serviceFullName
		
		self.isAuthService = isAuthService
		self.isUserService = isUserService
		self.isGroupOfUsersService = isGroupOfUsersService
	}
	
}
