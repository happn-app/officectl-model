import Foundation



extension Result {
	
	var failure: Failure? {
		switch self {
			case .success:        return nil
			case .failure(let f): return f
		}
	}
	
}
