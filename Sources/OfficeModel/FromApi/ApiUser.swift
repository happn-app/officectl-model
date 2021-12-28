import Foundation

import Email



struct ApiUser : Codable {
	
	var emails: [Email]?
	
	var firstName: String?
	var lastName: String?
	var nickname: String?
	
	var usersByServiceId: [String: ApiDirectoryUser?]
	
}
