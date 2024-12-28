//
//	StaffTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-17.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

//<next>
//  <location>
//	  <fractions>1/4</fractions>
//	</location>
//</next>

//<next>
//  <location>
//    <measures>1</measures>
//	  <fractions>-1/4</fractions>
//	</location>
//</next>

@Suite final class StaffTests {
	@Test func staffID1() async throws {
		let xmlString = #"""
<Staff id="1">
  <VBox>
	<height>10</height>
	<eid>4294967419</eid>
	<Text>
	  <eid>8589934598</eid>
	  <style>title</style>
	  <text>Untitled score</text>
	</Text>
	<Text>
	  <eid>12884901894</eid>
	  <style>subtitle</style>
	  <text>Subtitle</text>
	</Text>
	<Text>
	  <eid>17179869190</eid>
	  <style>composer</style>
	  <text>Composer / arranger</text>
	</Text>
  </VBox>
  <Measure>
	<voice>
	  <KeySig>
		<eid>167503724567</eid>
		<linkedMain />
		<concertKey>0</concertKey>
	  </KeySig>
	  <TimeSig>
		<eid>171798691865</eid>
		<sigN>4</sigN>
		<sigD>4</sigD>
	  </TimeSig>
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
	  <Chord>
		<eid>184683593844</eid>
		<linkedMain />
		<durationType>quarter</durationType>
		<Note>
		  <eid>188978561045</eid>
		  <linkedMain />
		  <pitch>47</pitch>
		  <tpc>19</tpc>
		  <fret>2</fret>
		  <string>4</string>
		</Note>
	  </Chord>
	  <Chord>
		<eid>193273528436</eid>
		<linkedMain />
		<durationType>quarter</durationType>
		<Note>
		  <eid>197568495637</eid>
		  <linkedMain />
		  <pitch>52</pitch>
		  <tpc>18</tpc>
		  <fret>2</fret>
		  <string>3</string>
		</Note>
	  </Chord>
	  <Chord>
		<eid>201863463028</eid>
		<linkedMain />
		<durationType>quarter</durationType>
		<Note>
		  <eid>206158430229</eid>
		  <linkedMain />
		  <Accidental>
			<subtype>accidentalSharp</subtype>
			<eid>210453397521</eid>
		  </Accidental>
		  <pitch>56</pitch>
		  <tpc>22</tpc>
		  <fret>1</fret>
		  <string>2</string>
		</Note>
	  </Chord>
	</voice>
  </Measure>
</Staff>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let staff: Staff = try xmlParser[Staff.nodeKey].value()
		#expect(staff.id == 1)
//		#expect(staff.vBox != nil)
		#expect(staff.measures.count == 1)
	}
}
