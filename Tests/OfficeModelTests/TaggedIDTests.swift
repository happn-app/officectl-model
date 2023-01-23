import Foundation
import XCTest

@testable import OfficeModel



final class TaggedIDTests : XCTestCase {
	
	func testEncodingOfTag() throws {
		let tag: Tag = "yolo"
		let encoded = try JSONEncoder().encode(tag)
		XCTAssertEqual(encoded, Data(#""yolo""#.utf8))
		XCTAssertEqual(try JSONDecoder().decode(Tag.self, from: encoded), tag)
	}
	
	func testEncodingOfDictionaryWithTagKeys() throws {
		let dic: [Tag: String] = ["key1": "val1", "key2": "val2"]
		let encoded = try JSONEncoder().encode(dic)
		/* Tag is not a String, so the encoder uses an unkeyed container for the dictionary. */
		XCTAssert(
			encoded == Data(#"["key1","val1","key2","val2"]"#.utf8) ||
			encoded == Data(#"["key2","val2","key1","val1"]"#.utf8)
		)
		XCTAssertEqual(try JSONDecoder().decode([Tag: String].self, from: encoded), dic)
	}
	
	func testEncodingOfApiMultiServicesID() throws {
		let multiServicesID = ApiMultiServicesID(ids: ["key1": "val1"])
		let encoded = try JSONEncoder().encode(multiServicesID)
		XCTAssertEqual(encoded, Data(#"{"key1":"val1"}"#.utf8))
		XCTAssertEqual(try JSONDecoder().decode(ApiMultiServicesID.self, from: encoded).ids, multiServicesID.ids)
	}
	
}
