//
//	ChordTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class ChordTests {
	@Test func parseChord() async throws {
		let xmlString = """
<Chord>
<eid>176093659252</eid>
<linkedMain />
<durationType>quarter</durationType>
<Note>
<eid>180388626453</eid>
<linkedMain />
<pitch>40</pitch>
<tpc>18</tpc>
<fret>0</fret>
<string>5</string>
</Note>
</Chord>
"""

		let xmlParser = XMLHash.parse(xmlString)

		let chord: Chord = try xmlParser["Chord"].value()
		#expect(chord.eid == 176093659252)
		#expect(chord.linkedMain == true)
		#expect(chord.durationType == .quarter)
	}
}
