import Foundation

import Email
import GenericJSON



public struct ApiDirectoryUser : Codable {
	
	public var userId: TaggedId
	public var persistentId: TaggedId?
	
	public var identifyingEmail: Email?
	public var otherEmails: [Email]
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	/* Note: We could use GenericStorage, but this would complexify conformance to Codable so we’ll keep JSON, at least for now. */
	public var underlyingUser: JSON?
	
}
