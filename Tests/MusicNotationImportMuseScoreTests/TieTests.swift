//
//	TieTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class TieTests {
	@Test func channelParseOpen() async throws {
		let xmlString = #"""
<Tie name="open">
  <program value="27" />
  <synti>Fluid</synti>
</Tie>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let tie: Tie = try xmlParser[Tie.nodeKey].value()
//		#expect(tie.name == "open")
//		#expect(tie.program == 27)
//		#expect(tie.synthesizer == "Fluid")
	}
}
