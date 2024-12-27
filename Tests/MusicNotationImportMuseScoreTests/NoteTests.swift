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
	@Test func eid() async throws {
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
  <string>0</string>
</Note>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let note: Note = try xmlParser[Note.nodeKey].value()
		#expect(note.eid == 227633266709)
	}
}
