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
<Tie>
  <eid>231928234015</eid>
  <linkedMain />
</Tie>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let tie: Tie = try xmlParser[Tie.nodeKey].value()
		#expect(tie.eid == 231928234015)
		#expect(tie.linkedMain == true)
	}
}
