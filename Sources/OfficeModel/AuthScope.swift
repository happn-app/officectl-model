import Foundation



public enum AuthScope : String, Codable, Hashable, Equatable {
	
	case userList = "user_list"
	case userCreate = "user_create"
	case userDelete = "user_delete"
	
}
