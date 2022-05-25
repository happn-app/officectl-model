import Foundation

import UnwrapOrThrow



public struct ApiTokenResponse : Codable, Sendable {
	
	public var userID: String
	
	public var accessToken: String
	public var tokenType: String = "bearer"
	
	/** If `nil`, all the scope in the request are granted. */
	public var scope: Set<AuthScope>?
	/** If `nil`, the token does not expire. */
	public var expiresIn: TimeInterval?
	
	public var refreshToken: String?
	
	public init(userID: String, accessToken: String, tokenType: String = "bearer", scope: Set<AuthScope>? = nil, expiresIn: TimeInterval? = nil, refreshToken: String? = nil) {
		self.userID = userID
		self.accessToken = accessToken
		self.tokenType = tokenType
		self.scope = scope
		self.expiresIn = expiresIn
		self.refreshToken = refreshToken
	}
	
	/* We custom encode scope, so we need custom decoder. */
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.userID       = try container.decode(String.self, forKey: .userID)
		self.accessToken  = try container.decode(String.self, forKey: .accessToken)
		self.tokenType    = try container.decode(String.self, forKey: .tokenType)
		self.expiresIn    = try container.decodeIfPresent(Double.self, forKey: .expiresIn)
		self.refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
		
		let scopeError = DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.scope], debugDescription: "Found invalid scope in response", underlyingError: nil))
		self.scope = try (
			container.decodeIfPresent(String.self, forKey: .scope)?
				.split(separator: " ")
				.map{ try AuthScope(rawValue: String($0)) ?! scopeError }
		).flatMap{ Set($0) }
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(userID,      forKey: .userID)
		try container.encode(accessToken, forKey: .accessToken)
		try container.encode(tokenType,   forKey: .tokenType)
		try container.encodeIfPresent(expiresIn,    forKey: .expiresIn)
		try container.encodeIfPresent(refreshToken, forKey: .refreshToken)
		
		try container.encodeIfPresent(scope?.map{ $0.rawValue }.joined(separator: " "), forKey: .scope)
	}
	
	private enum CodingKeys : String, CodingKey {
		case userID = "user_id"
		
		case accessToken = "access_token"
		case tokenType = "token_type"
		
		case scope
		case expiresIn = "expires_in"
		
		case refreshToken = "refresh_token"
	}
	
}
