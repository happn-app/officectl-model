import Foundation

import Email
@preconcurrency import GenericJSON



/** The representation of a user in a single directory (e.g. an LDAP user). */
public struct ApiDirectoryUser : Codable, Sendable {
	
	/* For convenience, but not really a part of the user. */
	public var serviceID: String
	
	public var userID: String
	public var persistentID: String?
	
	public var isSuspended: Bool?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var emails: [Email]?
	
	public var nonStandardProperties: [String: JSON]
	
	public init(
		serviceID: String,
		userID: String, persistentID: String? = nil,
		isSuspended: Bool? = nil,
		firstName: String? = nil, lastName: String? = nil, nickname: String? = nil,
		emails: [Email]? = nil,
		nonStandardProperties: [String : JSON]
	) {
		self.serviceID = serviceID
		self.userID = userID
		self.persistentID = persistentID
		self.isSuspended = isSuspended
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		self.emails = emails
		self.nonStandardProperties = nonStandardProperties
	}
	
}
