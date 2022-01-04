import Foundation

import Email



public struct ApiUser : Codable {
	
	public var emails: [Email]?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var usersByServiceID: [String: ApiDirectoryUser?]
	
	public init(emails: [Email]? = nil, firstName: String? = nil, lastName: String? = nil, nickname: String? = nil, usersByServiceID: [String : ApiDirectoryUser?]) {
		self.emails = emails
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		self.usersByServiceID = usersByServiceID
	}
	
}
