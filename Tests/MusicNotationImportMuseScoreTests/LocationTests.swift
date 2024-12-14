//
//	LocationTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-13.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

//<next>
//  <location>
//	  <fractions>1/4</fractions>
//	</location>
//</next>

//<next>
//  <location>
//    <measures>1</measures>
//	  <fractions>-1/4</fractions>
//	</location>
//</next>

@Suite final class LocationTests {
	@Test func noMeasures() async throws {
		let xmlParser = XMLHash.parse("<location><fractions>1/4</fractions></location>")
		let location: Location = try xmlParser[Location.nodeKey].value()
		#expect(location.measures == nil)
	}

	@Test func fractions() async throws {
		let xmlParser = XMLHash.parse("<location><fractions>1/4</fractions></location>")
		let location: Location = try xmlParser[Location.nodeKey].value()
		#expect(location.fractions == "1/4")
	}
}
