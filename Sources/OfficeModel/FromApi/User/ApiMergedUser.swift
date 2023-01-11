import Foundation

import Email



public struct ApiMergedUser : Codable, Sendable {
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var emails: [Email]?
	
	init(
		firstName: String? = nil, lastName: String? = nil, nickname: String? = nil,
		emails: [Email]? = nil
	) {
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		self.emails = emails
	}
	
}
