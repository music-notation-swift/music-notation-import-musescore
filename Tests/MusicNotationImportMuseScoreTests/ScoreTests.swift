//
//	ScoreTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class ScoreTests {
	@Test func scoreParse() async throws {
		let xmlString = #"""
<Channel>
  <controller ctrl="0" value="1" />
  <controller ctrl="32" value="17" />
  <program value="72" />
  <synti>Fluid</synti>
  <midiPort>2</midiPort>
  <midiChannel>3</midiChannel>
</Channel>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let score: Score = try xmlParser[Score.nodeKey].value()
	}
}
