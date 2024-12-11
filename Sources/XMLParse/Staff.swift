//
//	Staff.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Staff id="1">
//  <VBox>
//	<height>10</height>
//	<eid>4294967419</eid>
//	<Text>
//	  <eid>8589934598</eid>
//	  <style>title</style>
//	  <text>Untitled score</text>
//	</Text>
//	<Text>
//	  <eid>12884901894</eid>
//	  <style>subtitle</style>
//	  <text>Subtitle</text>
//	</Text>
//	<Text>
//	  <eid>17179869190</eid>
//	  <style>composer</style>
//	  <text>Composer / arranger</text>
//	</Text>
//  </VBox>
//  <Measure>
//	<voice>
//	  <KeySig>
//		<eid>167503724567</eid>
//		<linkedMain />
//		<concertKey>0</concertKey>
//	  </KeySig>
//	  <TimeSig>
//		<eid>171798691865</eid>
//		<sigN>4</sigN>
//		<sigD>4</sigD>
//	  </TimeSig>
//	  <Chord>
//		<eid>176093659252</eid>
//		<linkedMain />
//		<durationType>quarter</durationType>
//		<Note>
//		  <eid>180388626453</eid>
//		  <linkedMain />
//		  <pitch>40</pitch>
//		  <tpc>18</tpc>
//		  <fret>0</fret>
//		  <string>5</string>
//		</Note>
//	  </Chord>
//	  <Chord>
//		<eid>184683593844</eid>
//		<linkedMain />
//		<durationType>quarter</durationType>
//		<Note>
//		  <eid>188978561045</eid>
//		  <linkedMain />
//		  <pitch>47</pitch>
//		  <tpc>19</tpc>
//		  <fret>2</fret>
//		  <string>4</string>
//		</Note>
//	  </Chord>
//	  <Chord>
//		<eid>193273528436</eid>
//		<linkedMain />
//		<durationType>quarter</durationType>
//		<Note>
//		  <eid>197568495637</eid>
//		  <linkedMain />
//		  <pitch>52</pitch>
//		  <tpc>18</tpc>
//		  <fret>2</fret>
//		  <string>3</string>
//		</Note>
//	  </Chord>
//	  <Chord>
//		<eid>201863463028</eid>
//		<linkedMain />
//		<durationType>quarter</durationType>
//		<Note>
//		  <eid>206158430229</eid>
//		  <linkedMain />
//		  <Accidental>
//			<subtype>accidentalSharp</subtype>
//			<eid>210453397521</eid>
//		  </Accidental>
//		  <pitch>56</pitch>
//		  <tpc>22</tpc>
//		  <fret>1</fret>
//		  <string>2</string>
//		</Note>
//	  </Chord>
//	</voice>
//  </Measure>
//</Staff>

public struct Staff: XMLObjectDeserialization {
	static let nodeKey = "Staff"
	var id: Int
	var vBox: VBox
	var measures: [Measure]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Staff(
			id: try node.value(ofAttribute: "id"),
			vBox: try node["VBox"].value(),
			measures: try node[Measure.nodeKey].value()
		)
	}
}

