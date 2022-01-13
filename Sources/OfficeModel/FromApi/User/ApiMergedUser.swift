import Foundation

import Email



public struct ApiMergedUser : Codable {
	
	public var emails: [Email]?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public init(emails: [Email]? = nil, firstName: String? = nil, lastName: String? = nil, nickname: String? = nil) {
		self.emails = emails
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
	}
	
}
