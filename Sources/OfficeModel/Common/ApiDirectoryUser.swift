import Foundation

import Email
import GenericJSON



public struct ApiDirectoryUser : Codable {
	
	public var serviceID: String
	public var userID: String
	@RemoteProperty public var persistentID: String?
	
	@RemoteProperty public var identifyingEmail: Email??
	@RemoteProperty public var otherEmails: [Email]?
	
	@RemoteProperty public var firstName: String??
	@RemoteProperty public var lastName: String??
	@RemoteProperty public var nickname: String??
	
	/* Note: We could use GenericStorage, but this would complexify conformance to Codable so we’ll keep JSON, at least for now. */
	public var underlyingUser: JSON?
	
	public init(serviceID: String, userID: String, persistentID: String?, identifyingEmail: Email?, otherEmails: [Email]?, firstName: String??, lastName: String??, nickname: String??, underlyingUser: JSON? = nil) {
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
	
	public init(serviceID: String, userID: String, remotePersistentID: RemoteProperty<String>, remoteIdentifyingEmail: RemoteProperty<Email?>, remoteOtherEmails: RemoteProperty<[Email]>, remoteFirstName: RemoteProperty<String?>, remoteLastName: RemoteProperty<String?>, remoteNickname: RemoteProperty<String?>, underlyingUser: JSON? = nil) {
		self.serviceID = serviceID
		self.userID = userID
		self._persistentID = remotePersistentID
		self._identifyingEmail = remoteIdentifyingEmail
		self._otherEmails = remoteOtherEmails
		self._firstName = remoteFirstName
		self._lastName = remoteLastName
		self._nickname = remoteNickname
		self.underlyingUser = underlyingUser
	}
	
}
