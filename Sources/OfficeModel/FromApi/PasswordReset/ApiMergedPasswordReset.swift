import Foundation



public struct ApiMergedPasswordReset : Codable {
	
	/** `true` if at least one reset is in the `running` state. */
	public var isExecuting: Bool
	
	public init(isExecuting: Bool, directoryPasswordResets: [String: ApiDirectoryPasswordReset]) {
		self.isExecuting = isExecuting
	}
	
}
