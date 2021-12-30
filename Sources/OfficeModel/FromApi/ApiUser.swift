import Foundation

import Email



public struct ApiUser : Codable {
	
	public var emails: [Email]?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var usersByServiceId: [String: ApiDirectoryUser?]
	
	public init(emails: [Email]? = nil, firstName: String? = nil, lastName: String? = nil, nickname: String? = nil, usersByServiceId: [String : ApiDirectoryUser?]) {
		self.emails = emails
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		self.usersByServiceId = usersByServiceId
	}
	
}
