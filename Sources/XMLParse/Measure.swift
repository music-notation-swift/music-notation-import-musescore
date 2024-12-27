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

public struct Measure: XMLObjectDeserialization {
	static let nodeKey = "Measure"
	var voices: [Voice]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Measure(voices: try node[Voice.nodeKey].value())
	}
}
