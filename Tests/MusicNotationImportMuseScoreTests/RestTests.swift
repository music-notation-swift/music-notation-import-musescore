//
//	RestTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-28.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class RestTests {
	@Test func restParseMeasureDuration() async throws {
		let xmlString = #"""
<Rest>
  <eid>1275605286938</eid>
  <durationType>measure</durationType>
  <duration>2/4</duration>
</Rest>
"""#

		let xmlParser = XMLHash.parse(xmlString)

		let rest: Rest = try xmlParser[Rest.nodeKey].value()
		#expect(rest.eid == 1275605286938)
		#expect(rest.durationType == .measure)
		#expect(rest.duration == "2/4")
	}

	@Test func parseRest() async throws {
		let xmlString = #"""
<Rest>
  <eid>655094181789722</eid>
  <durationType>eighth</durationType>
</Rest>
"""#

		let xmlParser = XMLHash.parse(xmlString)

		let rest: Rest = try xmlParser[Rest.nodeKey].value()
		#expect(rest.eid == 655094181789722)
		#expect(rest.durationType == .eighth)
	}
}
