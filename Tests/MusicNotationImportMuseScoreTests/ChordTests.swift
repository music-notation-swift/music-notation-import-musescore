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
	@Test func parseArray() async throws {
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

//		<Chord>
//		<eid>184683593844</eid>
//		<linkedMain />
//		<durationType>quarter</durationType>
//		<Note>
//		<eid>188978561045</eid>
//		<linkedMain />
//		<pitch>47</pitch>
//		<tpc>19</tpc>
//		<fret>2</fret>
//		<string>4</string>
//		</Note>
//		</Chord>
//		<Chord>
//		<eid>193273528436</eid>
//		<linkedMain />
//		<durationType>quarter</durationType>
//		<Note>
//		<eid>197568495637</eid>
//		<linkedMain />
//		<pitch>52</pitch>
//		<tpc>18</tpc>
//		<fret>2</fret>
//		<string>3</string>
//		</Note>
//		</Chord>

		let xmlParser = XMLHash.parse(xmlString)

		let chord: Chord = try xmlParser["Chord"].value()
		#expect(chord.eid == 176093659252)
		#expect(chord.linkedMain == true)
	}
}
