//
//	Note.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

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
//  <eid>377957122069</eid>
//  <linked></linked>
//  <pitch>40</pitch>
//  <tpc>18</tpc>
//  <fret>0</fret>
//  <string>5</string>
//</Note>

public struct Note: XMLObjectDeserialization {
	var eid: Int
	var linkedMain: Bool?
	var pitch: Int
	var tpc: Int
	var fret: Int
	var string: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Note(
			eid: try node["eid"].value(),
			linkedMain: try node["linkedMain"].value(),
			pitch: try node["pitch"].value(),
			tpc: try node["tpc"].value(),
			fret: try node["fret"].value(),
			string: try node["string"].value()
		)
	}
}
