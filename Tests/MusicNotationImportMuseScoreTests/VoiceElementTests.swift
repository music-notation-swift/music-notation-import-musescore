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
		let voiceElements = try xmlParser[VoiceElement.nodeKey].children.compactMap { try $0.value() as VoiceElement }
		#expect(voiceElements.isEmpty == false)
		#expect(voiceElements.count == 6)
		#expect(voiceElements[3].isNearEqual(to: VoiceElement.chord(Chord.empty())))
	}

	@Test func voiceElementRestNearEquality() async throws {
		let rest1 = VoiceElement.rest(Rest(eid: 1, durationType: .eighth, duration: "12"))
		let rest2 = VoiceElement.rest(Rest(eid: 2, durationType: .quarter, duration: "foo"))

		#expect(rest1.isNearEqual(to: rest2))
	}

	@Test func voiceElementChordNearEquality() async throws {
		let note1 = Note(eid: 1, linkedMain: true, visible: true, noteDot: nil, spanner: nil, pitch: 1, tpc: 1, played: nil, fret: nil, string: nil)
		let note2 = Note(eid: 2, linkedMain: true, visible: true, noteDot: nil, spanner: nil, pitch: 1, tpc: 1, played: nil, fret: nil, string: nil)

		let chord1 = VoiceElement.chord(Chord(eid: 1, linkedMain: false, dots: 1, durationType: .quarter, stem: Stem(eid: 1, visible: true), note: note1))
		let chord2 = VoiceElement.chord(Chord(eid: 2, linkedMain: true, dots: 2, durationType: .measure, stem: Stem(eid: 2, visible: false), note: note2))

		#expect(chord1.isNearEqual(to: chord2))
	}

	@Test func voiceElementKeySignatureNearEquality() async throws {
		let keySignature1 = VoiceElement.keySignature(KeySignature(eid: 1, linkedMain: true, concertKey: -1))
		let keySignature2 = VoiceElement.keySignature(KeySignature(eid: 2, linkedMain: false, concertKey: -2))

		#expect(keySignature1.isNearEqual(to: keySignature2))
	}

	@Test func voiceElementTimeSignatureNearEquality() async throws {
		let timeSignature1 = VoiceElement.timeSignature(TimeSignature(eid: 1, numerator: 1, denominator: 1))
		let timeSignature2 = VoiceElement.timeSignature(TimeSignature(eid: 2, numerator: 2, denominator: 2))

		#expect(timeSignature1.isNearEqual(to: timeSignature2))
	}

	@Test func voiceElementNotNearEquality() async throws {
		let timeSignature1 = VoiceElement.timeSignature(TimeSignature(eid: 1, numerator: 1, denominator: 1))
		let keySignature1 = VoiceElement.keySignature(KeySignature(eid: 2, linkedMain: false, concertKey: -2))

		#expect(timeSignature1.isNearEqual(to: keySignature1) == false)
	}
}
