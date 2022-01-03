import Foundation

import Email
import GenericJSON



public struct ApiDirectoryUser : Codable {
	
	public var serviceID: String
	
	public var userID: String
	public var persistentID: String?
	
	public var identifyingEmail: Email?
	public var otherEmails: [Email]?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	/* Note: We could use GenericStorage, but this would complexify conformance to Codable so we’ll keep JSON, at least for now. */
	public var underlyingUser: JSON?
	
	public init(serviceID: String, userID: String, persistentID: String? = nil, identifyingEmail: Email? = nil, otherEmails: [Email]? = nil, firstName: String? = nil, lastName: String? = nil, nickname: String? = nil, underlyingUser: JSON? = nil) {
		self.serviceID = serviceID
		self.userID = userID
		self.persistentID = persistentID
		self.identifyingEmail = identifyingEmail
		self.otherEmails = otherEmails
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		self.underlyingUser = underlyingUser
	}
	
}
