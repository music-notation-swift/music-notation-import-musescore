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
		let xmlString = #"""
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
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let chord: Chord = try xmlParser[Chord.nodeKey].value()
		#expect(chord.eid == 176093659252)
		#expect(chord.linkedMain == true)
		#expect(chord.dots == nil)
		#expect(chord.durationType == .quarter)

		#expect(chord.note.eid == 180388626453)
		#expect(chord.note.linkedMain == true)
		#expect(chord.note.visible == false)
		#expect(chord.note.noteDot == nil)
		#expect(chord.note.pitch == 40)
		#expect(chord.note.tpc == 18)
		#expect(chord.note.fret == 0)
		#expect(chord.note.string == 5)
	}

	@Test func parseComplexChord() async throws {
		let xmlString = #"""
<Chord>
  <eid>485520283009139</eid>
  <dots>1</dots>
  <durationType>half</durationType>
  <Stem>
	<eid>485533167910930</eid>
	<visible>0</visible>
  </Stem>
  <Note>
	<eid>485537462878228</eid>
	<visible>0</visible>
	<NoteDot>
	  <eid>485541757845589</eid>
	  <visible>0</visible>
	</NoteDot>
	<pitch>84</pitch>
	<tpc>14</tpc>
	<play>0</play>
  </Note>
</Chord>
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let chord: Chord = try xmlParser[Chord.nodeKey].value()
		#expect(chord.eid == 485520283009139)
		#expect(chord.linkedMain == false)
		#expect(chord.dots == 1)
		#expect(chord.durationType == .half)

		#expect(chord.stem?.eid == 485533167910930)
		#expect(chord.stem?.visible == false)

		#expect(chord.note.eid == 485537462878228)
		#expect(chord.note.linkedMain == false)
		#expect(chord.note.visible == false)
		#expect(chord.note.noteDot?.eid == 485541757845589)
		#expect(chord.note.noteDot?.visible == false)
		#expect(chord.note.pitch == 84)
		#expect(chord.note.tpc == 14)
		#expect(chord.note.played == false)
	}
}
