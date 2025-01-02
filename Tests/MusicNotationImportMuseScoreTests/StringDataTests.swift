//
//	StringDataTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class StringDataTests {
	@Test func channelParseOpen() async throws {
		let xmlString = #"""
<StringData name="open">
  <program value="27" />
  <synti>Fluid</synti>
</StringData>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let stringData: StringData = try xmlParser[StringData.nodeKey].value()
//		#expect(stringData.name == "open")
//		#expect(stringData.program == 27)
//		#expect(stringData.synthesizer == "Fluid")
	}
}
