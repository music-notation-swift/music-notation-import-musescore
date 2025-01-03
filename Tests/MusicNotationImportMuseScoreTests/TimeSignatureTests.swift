//
//	TimeSignatureTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class TimeSignatureTests {
	@Test func timeSignatureParseOpen() async throws {
		let xmlString = #"""
<TimeSig>
  <eid>171798691865</eid>
  <sigN>12</sigN>
  <sigD>8</sigD>
</TimeSig>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let timeSignature: TimeSignature = try xmlParser[TimeSignature.nodeKey].value()
		#expect(timeSignature.eid == 171798691865)
		#expect(timeSignature.numerator == 12)
		#expect(timeSignature.denominator == 8)
	}
}
