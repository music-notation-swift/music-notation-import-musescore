//
//	FamilyTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class FamilyTests {
	@Test func parseFamily() async throws {
		let xmlParser = XMLHash.parse("<family id=\"guitars\">Guitars</family>")
		let family: Family = try xmlParser["family"].value()
		#expect(family.id == "guitars")
		#expect(family.name == "Guitars")
	}
}
