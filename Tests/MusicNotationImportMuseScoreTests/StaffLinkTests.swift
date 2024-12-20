//
//	StaffLinkTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-17.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

//<Staff id="1">
//  <linkedTo>2</linkedTo>
//  <StaffType group="pitched">
//	<name>stdNormal</name>
//  </StaffType>
//  <defaultClef>G8vb</defaultClef>
//</Staff>

@Suite final class StaffLinkTests {
	@Test func staffLinkParse() async throws {
		let xmlParser = XMLHash.parse("<linkedTo>2</linkedTo>")
		let staffLink: StaffLink = try xmlParser[StaffLink.nodeKey].value()
		#expect(staffLink.id == 2)
	}

	@Test func staffLinkParseFail() async throws {
		let xmlParser = XMLHash.parse("<linkedTo>xxx</linkedTo>")
		#expect(throws: XMLDeserializationError.self) {
			_ = try xmlParser[StaffLink.nodeKey].value() as StaffLink
		}
	}
}
