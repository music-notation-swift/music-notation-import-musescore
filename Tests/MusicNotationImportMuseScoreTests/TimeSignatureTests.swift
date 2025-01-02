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
<TimeSignature name="open">
  <program value="27" />
  <synti>Fluid</synti>
</TimeSignature>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let timeSignature: TimeSignature = try xmlParser[TimeSignature.nodeKey].value()
//		#expect(timeSignature.name == "open")
//		#expect(timeSignature.program == 27)
//		#expect(timeSignature.synthesizer == "Fluid")
	}
}
