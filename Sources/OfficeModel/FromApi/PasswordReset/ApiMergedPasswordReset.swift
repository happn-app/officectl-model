import Foundation



public struct ApiMergedPasswordReset : Codable, Sendable {
	
	/** `true` if at least one reset is in the `running` state. */
	public var isExecuting: Bool
	
	public init(isExecuting: Bool) {
		self.isExecuting = isExecuting
	}
	
}
