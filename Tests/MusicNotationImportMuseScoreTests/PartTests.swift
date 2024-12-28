//
//	PartTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-27.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing


@Suite final class PartTests {
	@Test func partParse() async throws {
		let xmlString = #"""
<Part id="1">
  <Staff id="1">
    <StaffType group="pitched">
      <name>stdNormal</name>
    </StaffType>
    <defaultConcertClef>G8va</defaultConcertClef>
    <defaultTransposingClef>G</defaultTransposingClef>
    <bracket type="0" span="14" col="0" visible="1"/>
    <barLineSpan>1</barLineSpan>
  </Staff>
  <trackName>Flauto piccolo (Piccolo)</trackName>
  <Instrument id="piccolo">
    <longName>Flauto piccolo</longName>
    <shortName>Fl. picc.</shortName>
    <trackName>Piccolo</trackName>
    <minPitchP>74</minPitchP>
    <maxPitchP>108</maxPitchP>
    <minPitchA>74</minPitchA>
    <maxPitchA>105</maxPitchA>
    <transposeDiatonic>7</transposeDiatonic>
    <transposeChromatic>12</transposeChromatic>
    <instrumentId>wind.flutes.flute.piccolo</instrumentId>
    <concertClef>G8va</concertClef>
    <transposingClef>G</transposingClef>
    <Articulation>
      <velocity>100</velocity>
      <gateTime>100</gateTime>
    </Articulation>
    <Articulation name="marcatoTenuto">
      <velocity>120</velocity>
      <gateTime>100</gateTime>
    </Articulation>
    <Channel>
      <controller ctrl="0" value="0"/>
      <controller ctrl="32" value="17"/>
      <program value="72"/>
      <synti>Fluid</synti>
      <midiPort>2</midiPort>
      <midiChannel>2</midiChannel>
    </Channel>
  </Instrument>
</Part>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let part: Part = try xmlParser[Part.nodeKey].value()
		#expect(part.id == 1)
	}
}
