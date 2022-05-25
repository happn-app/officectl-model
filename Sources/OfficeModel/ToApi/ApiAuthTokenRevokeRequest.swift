import Foundation



public struct ApiAuthTokenRevokeRequest : Codable, Sendable {
	
	public enum TokenType : String, Codable, Sendable {
		
		case accessToken = "access_token"
		case refreshToken = "refresh_token"
		
	}
	
	public var token: String
	public var tokenTypeHint: TokenType?
	
	/** If `nil`, **must** be passed via Basic Auth (recommended configuration). */
	public var clientID: String?
	public var clientSecret: String?
	
	public init(token: String, tokenTypeHint: ApiAuthTokenRevokeRequest.TokenType? = nil, clientID: String? = nil, clientSecret: String? = nil) {
		self.token = token
		self.tokenTypeHint = tokenTypeHint
		self.clientID = clientID
		self.clientSecret = clientSecret
	}
	
	private enum CodingKeys : String, CodingKey {
		case token
		case tokenTypeHint = "token_type_hint"
		
		case clientID = "client_id"
		case clientSecret = "client_secret"
	}
	
}
