//
//	VoiceElementTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class VoiceElementTests {
	@Test func voiceElementParse() async throws {
		let xmlString = #"""
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
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let voiceElements = try xmlParser["voice"].children.compactMap { try $0.value() as VoiceElement }
		#expect(voiceElements.isEmpty == false)
		#expect(voiceElements.count == 6)
		#expect(voiceElements[3].isNearEqual(to: VoiceElement.chord(Chord.empty())))
	}
}
