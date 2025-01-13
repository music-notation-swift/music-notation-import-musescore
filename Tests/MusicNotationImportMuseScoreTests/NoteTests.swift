//
//	NoteTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-22.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

//<Note>
//  <eid>227633266709</eid>
//  <linkedMain />
//  <Spanner type="Tie">
//		<Tie>
//		  	<eid>231928234015</eid>
//	  		<linkedMain />
//		</Tie>
//		<next>
//	  		<location>
//				<fractions>1/4</fractions>
//	  		</location>
//		</next>
//  </Spanner>
//  <pitch>64</pitch>
//  <tpc>18</tpc>
//  <fret>0</fret>
//  <string>0</string>
//</Note>

//<Note>
//  <eid>180388626453</eid>
//  <linkedMain />
//  <pitch>40</pitch>
//  <tpc>18</tpc>
//  <fret>0</fret>
//  <string>5</string>
//</Note>

@Suite final class NoteTests {
	@Test func noteParseSpannerTie() async throws {
		let xmlString = #"""
<Note>
  <eid>227633266709</eid>
  <linkedMain />
  <Spanner type="Tie">
 <Tie>
 <eid>231928234015</eid>
 <linkedMain />
 </Tie>
 <next>
 <location>
   <fractions>1/4</fractions>
 </location>
 </next>
  </Spanner>
  <pitch>64</pitch>
  <tpc>18</tpc>
  <fret>0</fret>
  <string>1</string>
</Note>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let note: Note = try xmlParser[Note.nodeKey].value()

		if let spannerType = note.spanner?.spannerType, case Spanner.SpannerType.tie(let tie) = spannerType {
			#expect(tie != nil)
		} else {
			#expect(Bool(false))
		}

		#expect(note.eid == 227633266709)
		#expect(note.spanner?.next != nil)
		#expect(note.pitch == 64)
		#expect(note.tpc == 18)
		#expect(note.fret == 0)
		#expect(note.string == 1)
	}

	@Test func noteParseNoteDot() async throws {
		let xmlString = #"""
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
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let note: Note = try xmlParser[Note.nodeKey].value()

		#expect(note.eid == 485537462878228)
		#expect(note.visible == false)
		#expect(note.noteDot != nil)
		#expect(note.noteDot?.eid == 485541757845589)
		#expect(note.noteDot?.visible == false)
		#expect(note.pitch == 84)
		#expect(note.tpc == 14)
		#expect(note.played == false)
		#expect(note.fret == nil)
		#expect(note.string == nil)
	}

	@Test func noteParseAccidental() async throws {
		let xmlString = #"""
<Note>
  <eid>6734508720148</eid>
  <Accidental>
	<subtype>accidentalNatural</subtype>
	<eid>183914794582032</eid>
  </Accidental>
  <pitch>41</pitch>
  <tpc>13</tpc>
  <fret>2</fret>
  <string>5</string>
</Note>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let note: Note = try xmlParser[Note.nodeKey].value()
		print("\(note)")

		#expect(note.eid == 6734508720148)
		#expect(note.accidental?.subtype == "accidentalNatural")
		#expect(note.accidental?.eid == 183914794582032)
		#expect(note.visible == false)
		#expect(note.noteDot == nil)
		#expect(note.spanner == nil)
		#expect(note.pitch == 41)
		#expect(note.tpc == 13)
		#expect(note.played == nil)
		#expect(note.fret == 2)
		#expect(note.string == 5)
	}

}
