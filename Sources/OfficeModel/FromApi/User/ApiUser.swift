import Foundation



/**
 The actual “user” object type for officectl API.
 
 This is a combination of a merged user representing all the properties of all the directory users merged into one,
  and a hash of all the directory users indexed by their source directory ID. */
public typealias ApiUser = ApiMultiServicesResults<ApiMergedUser, ApiDirectoryUser?>
