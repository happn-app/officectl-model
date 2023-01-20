import Foundation

import Email
@preconcurrency import GenericJSON



public struct CreateOrUpdateUserQuery : Codable, Sendable {
	
	public var serviceIDs: [String]?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var emails: [Email]?
	
	public var customProperties: [String: JSON]
	
	init(
		serviceIDs: [String]? = nil,
		firstName: String? = nil, lastName: String? = nil, nickname: String? = nil,
		emails: [Email]? = nil,
		customProperties: [String : JSON]
	) {
		self.serviceIDs = serviceIDs
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		self.emails = emails
		self.customProperties = customProperties
	}
	
	enum CodingKeys : String, CodingKey {
		case serviceIDs = "service_ids"
		case firstName = "first_name"
		case lastName = "last_name"
		case nickname
		case emails
		case customProperties = "custom_properties"
	}
	
}
