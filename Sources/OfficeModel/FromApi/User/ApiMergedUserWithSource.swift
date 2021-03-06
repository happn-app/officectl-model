import Foundation

import Email



public struct ApiMergedUserWithSource : Codable, Sendable {
	
	public var emails: [Email]?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var directoryUsers: [String: ApiDirectoryUser]
	
	public init(emails: [Email]? = nil, firstName: String? = nil, lastName: String? = nil, nickname: String? = nil, directoryUsers: [String: ApiDirectoryUser]) {
		self.emails = emails
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		self.directoryUsers = directoryUsers
	}
	
	public init(mergedUser: ApiMergedUser, directoryUsers: [String: ApiDirectoryUser]) {
		self.emails = mergedUser.emails
		self.firstName = mergedUser.firstName
		self.lastName = mergedUser.lastName
		self.nickname = mergedUser.nickname
		self.directoryUsers = directoryUsers
	}
	
}
