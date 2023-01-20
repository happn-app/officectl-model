import Foundation

import Email



/** The merge of multiple directory users. */
public struct ApiMergedUser : Codable, Sendable {
	
	public var ids: ApiMultiServicesID
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var emails: [Email]?
	
	public init(
		ids: ApiMultiServicesID,
		firstName: String? = nil, lastName: String? = nil, nickname: String? = nil,
		emails: [Email]? = nil
	) {
		self.ids = ids
		
		self.firstName = firstName
		self.lastName = lastName
		self.nickname = nickname
		
		self.emails = emails
	}
	
	public enum CodingKeys : String, CodingKey {
		case ids
		case firstName = "first_name"
		case lastName = "last_name"
		case nickname
		case emails
	}
	
}
