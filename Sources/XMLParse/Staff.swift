//
//	Staff.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Staff id="1">
//
//  <VBox>
//    <height>10</height>
//    <eid>4294967419</eid>
//    <Text>
//      <eid>8589934598</eid>
//      <style>title</style>
//      <text>Untitled score</text>
//    </Text>
//    <Text>
//      <eid>12884901894</eid>
//        <style>subtitle</style>
//        <text>Subtitle</text>
//    </Text>
//  </VBox>
//
//  <Measure>
//    <voice>
//      <KeySig>
//        <eid>167503724567</eid>
//        <linkedMain />
//        <concertKey>0</concertKey>
//      </KeySig>
//      <TimeSig>
//        <eid>171798691865</eid>
//        <sigN>4</sigN>
//        <sigD>4</sigD>
//      </TimeSig>
//      <Chord>
//        <eid>176093659252</eid>
//        <linkedMain />
//        <durationType>quarter</durationType>
//        <Note>
//          <eid>180388626453</eid>
//          <linkedMain />
//          <pitch>40</pitch>
//          <tpc>18</tpc>
//          <fret>0</fret>
//          <string>5</string>
//        </Note>
//      </Chord>
//      <Chord>
//        <eid>184683593844</eid>
//        <linkedMain />
//        <durationType>quarter</durationType>
//        <Note>
//          <eid>188978561045</eid>
//          <linkedMain />
//          <pitch>47</pitch>
//          <tpc>19</tpc>
//          <fret>2</fret>
//          <string>4</string>
//        </Note>
//      </Chord>
//      <Chord>
//        <eid>193273528436</eid>
//        <linkedMain />
//        <durationType>quarter</durationType>
//        <Note>
//          <eid>197568495637</eid>
//          <linkedMain />
//          <pitch>52</pitch>
//          <tpc>18</tpc>
//          <fret>2</fret>
//          <string>3</string>
//        </Note>
//      </Chord>
//      <Chord>
//        <eid>201863463028</eid>
//        <linkedMain />
//        <durationType>quarter</durationType>
//        <Note>
//          <eid>206158430229</eid>
//          <linkedMain />
//          <Accidental>
//            <subtype>accidentalSharp</subtype>
//            <eid>210453397521</eid>
//          </Accidental>
//          <pitch>56</pitch>
//          <tpc>22</tpc>
//          <fret>1</fret>
//          <string>2</string>
//        </Note>
//      </Chord>
//    </voice>
//  </Measure>
//  <Measure>
//    <voice>
//      <Chord>
//        <eid>214748364916</eid>
//        <linkedMain />
//        <durationType>quarter</durationType>
//        <Note>
//          <eid>219043332117</eid>
//          <linkedMain />
//          <pitch>59</pitch>
//          <tpc>19</tpc>
//          <fret>0</fret>
//          <string>1</string>
//        </Note>
//      </Chord>
//      <Chord>
//        <eid>223338299508</eid>
//        <linkedMain />
//        <durationType>quarter</durationType>
//        <Note>
//          <eid>227633266709</eid>
//          <linkedMain />
//          <Spanner type="Tie">
//            <Tie>
//              <eid>231928234015</eid>
//              <linkedMain />
//              </Tie>
//            <next>
//              <location>
//                <fractions>1/4</fractions>
//              </location>
//            </next>
//          </Spanner>
//          <pitch>64</pitch>
//          <tpc>18</tpc>
//          <fret>0</fret>
//          <string>0</string>
//        </Note>
//      </Chord>
//      <Chord>
//        <eid>236223201396</eid>
//        <linkedMain />
//        <durationType>half</durationType>
//        <Note>
//          <eid>240518168597</eid>
//          <linkedMain />
//          <Spanner type="Tie">
//            <prev>
//              <location>
//                <fractions>-1/4</fractions>
//              </location>
//            </prev>
//          </Spanner>
//          <pitch>64</pitch>
//          <tpc>18</tpc>
//          <fret>0</fret>
//          <string>0</string>
//        </Note>
//      </Chord>
//    </voice>
//  </Measure>
//  <Measure>
//    <voice>
//      <Rest>
//        <eid>244813135898</eid>
//        <linkedMain />
//        <durationType>measure</durationType>
//        <duration>4/4</duration>
//      </Rest>
//    </voice>
//  </Measure>
//</Staff>
public struct Staff: XMLObjectDeserialization {
	static let nodeKey = "Staff"

	var id: Int
	var boxes: [Box]?
	var measures: [Measure]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Staff(
			id: try node.value(ofAttribute: "id"),
			boxes: try node["VBox"].value(),
			measures: try node[Measure.nodeKey].value()
		)
	}
}

