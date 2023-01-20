import Foundation



/**
 The type representing a list of users.
 
 This is strangely _not_ directly an array of ``ApiUser``.
 The reason for this is we want to be able to convey the information that a service failed to return its list of users.
 
 We do not however want to return the list of all the users per service as this is not very useful.
 So instead of an array of ``ApiDirectoryUser``, the `Results` type for `ApiUsers` is `None`. */
public typealias ApiUsers = ApiMultiServicesResults<[ApiUser], None>
