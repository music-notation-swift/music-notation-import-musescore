//
//	Measure.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Measure>
//  <voice>
//	  <KeySig>
//	    <eid>167503724567</eid>
//	    <linkedMain />
//	    <concertKey>0</concertKey>
//	  </KeySig>
//	  <TimeSig>
//	    <eid>171798691865</eid>
//	    <sigN>4</sigN>
//	    <sigD>4</sigD>
//	  </TimeSig>
//	  <Chord>
//	    <eid>176093659252</eid>
//	    <linkedMain />
//	    <durationType>quarter</durationType>
//	    <Note>
//		  <eid>180388626453</eid>
//		  <linkedMain />
//		  <pitch>40</pitch>
//		  <tpc>18</tpc>
//		  <fret>0</fret>
//		  <string>5</string>
//	    </Note>
//	  </Chord>
//	  <Chord>
//	    <eid>184683593844</eid>
//	    <linkedMain />
//	    <durationType>quarter</durationType>
//	    <Note>
//		  <eid>188978561045</eid>
//		  <linkedMain />
//		  <pitch>47</pitch>
//		  <tpc>19</tpc>
//		  <fret>2</fret>
//		  <string>4</string>
//	    </Note>
//	  </Chord>
//  </voice>
//</Measure>

//<Measure len="1/2">
//  <irregular>1</irregular>
//  <voice>
//	  <KeySig>
//      <eid>555644214050839</eid>
//      <concertKey>1</concertKey>
//    </KeySig>
//    <TimeSig>
//      <eid>555652803985433</eid>
//      <sigN>3</sigN>
//      <sigD>2</sigD>
//      <Groups>
//        <Node pos="4" action="512" />
//        <Node pos="8" action="272" />
//        <Node pos="12" action="512" />
//        <Node pos="16" action="273" />
//        <Node pos="20" action="512" />
//        <Node pos="24" action="272" />
//        <Node pos="28" action="512" />
//        <Node pos="32" action="273" />
//        <Node pos="36" action="512" />
//        <Node pos="40" action="272" />
//        <Node pos="44" action="512" />
//      </Groups>
//    </TimeSig>
//    <Tempo>
//      <tempo>2.4</tempo>
//      <followText>1</followText>
//      <eid>555665688887343</eid>
//      <text>Andante maestoso
//      <sym>metNoteHalfUp</sym>
//      <font face="FreeSerif" />= 72</text>
//    </Tempo>
//    <Rest>
//      <eid>555669983854618</eid>
//      <durationType>half</durationType>
//    </Rest>
//  </voice>
//</Measure>

public struct Measure: XMLObjectDeserialization {
	static let nodeKey = "Measure"

	var lengthAttribute: String?
	var irregular: Bool
	var measureRepeat: Bool
	var voiceElements: [VoiceElement]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Measure(
			lengthAttribute: node.value(ofAttribute: "len"),
			irregular: try node["irregular"].value(found: true, notFound: false),
			measureRepeat: try node["MeasureRepeat"].value(found: true, notFound: false),
			voiceElements: try node["voice"].children.compactMap { try $0.value() as VoiceElement }
		)
	}
}
