import Foundation



/**
 The type representing a list of users.
 
 This is strangely _not_ directly an array of ``ApiUser``.
 The reason for this is we want to be able to convey the information that a service failed to return its list of users.
 
 We do not however want to return the list of all the merged users as this not really useful and would take a lot of space.
 So instead of an array of ``ApiMergedUser``, the `MergedResults` type for `ApiUsers` is `None`. */
public typealias ApiUsers = ApiMultiServicesResults<None, [ApiUser]>
