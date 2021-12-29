import Foundation

import Email



public struct ApiUser : Codable {
	
	public var emails: [Email]?
	
	public var firstName: String?
	public var lastName: String?
	public var nickname: String?
	
	public var usersByServiceId: [String: ApiDirectoryUser?]
	
}
