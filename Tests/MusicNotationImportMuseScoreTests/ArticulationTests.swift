//
//	ArticulationTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-27.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class ArticulationTests {
	@Test func parseUnnamedArticulation() async throws {
		let xmlString = #"""
<Articulation>
  <velocity>100</velocity>
  <gateTime>101</gateTime>
</Articulation>
"""#

		let xmlParser = XMLHash.parse(xmlString)

		let articulation: Articulation = try xmlParser[Articulation.nodeKey].value()
		#expect(articulation.name == nil)
		#expect(articulation.velocity == 100)
		#expect(articulation.gateTime == 101)
	}

	@Test func parseArticulation() async throws {
		let xmlString = #"""
<Articulation name="staccatissimo">
  <velocity>100</velocity>
  <gateTime>33</gateTime>
</Articulation>
"""#

		let xmlParser = XMLHash.parse(xmlString)

		let articulation: Articulation = try xmlParser[Articulation.nodeKey].value()
		#expect(articulation.name == "staccatissimo")
		#expect(articulation.velocity == 100)
		#expect(articulation.gateTime == 33)
	}
}
