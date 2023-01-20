import Foundation

import Email



public struct ChangeUserPasswordQuery : Codable, Sendable {
	
	public var serviceIDs: [String]?
	
	/* Optional because
	 *  1/ some services might support removing the password completly (e.g. LDAP) and
	 *  2/ we do not want to return the new password in the Action returned from GET <.../_actions/password-reset>. */
	public var newPassword: String?
	
	init(
		serviceIDs: [String]? = nil,
		newPassword: String
	) {
		self.serviceIDs = serviceIDs
		self.newPassword = newPassword
	}
	
	public enum CodingKeys : String, CodingKey {
		case serviceIDs = "service_ids"
		case newPassword = "new_password"
	}
	
}
