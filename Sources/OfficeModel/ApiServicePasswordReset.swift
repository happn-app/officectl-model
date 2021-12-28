import Foundation



/** The structure representing a password reset for a single user on a single service. */
public struct ApiServicePasswordReset : Codable {
	
	public var userId: String?
	
	public var hasRun: Bool
	public var isExecuting: Bool
	public var error: ApiError?
	
//	public init(passwordResetPair: AnyDSPasswordResetPair, environment: Environment) {
//		userId = passwordResetPair.dsuPair.taggedId.id
//
//		hasRun = !passwordResetPair.passwordReset.isWeak
//		isExecuting = passwordResetPair.passwordReset.isExecuting
//		error = passwordResetPair.passwordReset.result?.failureValue.flatMap{ ApiError(error: $0, environment: environment) }
//	}
	
}
