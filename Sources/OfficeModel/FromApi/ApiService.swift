import Foundation



public struct ApiService : Codable, Sendable {
	
	public var providerID: String
	
	public var serviceID: Tag
	public var serviceFullName: String
	
	public var isAuthService: Bool
	public var isUserService: Bool
	public var isGroupOfUsersService: Bool
	
	public init(
		providerID: String,
		serviceID: Tag, serviceFullName: String,
		isAuthService: Bool, isUserService: Bool, isGroupOfUsersService: Bool
	) {
		self.providerID = providerID
		
		self.serviceID = serviceID
		self.serviceFullName = serviceFullName
		
		self.isAuthService = isAuthService
		self.isUserService = isUserService
		self.isGroupOfUsersService = isGroupOfUsersService
	}
	
	public enum CodingKeys : String, CodingKey {
		case providerID = "provider_id"
		case serviceID = "service_id"
		case serviceFullName = "service_full_name"
		case isAuthService = "is_auth_service"
		case isUserService = "is_user_service"
		case isGroupOfUsersService = "is_group_of_users_service"
	}
	
}
