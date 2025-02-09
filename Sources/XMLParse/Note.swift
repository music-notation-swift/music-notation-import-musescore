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
	static let nodeKey = "Note"

	var eid: Int
	var accidental: Accidental?
	var linkedMain: Bool
	var visible: Bool
	var noteDot: NoteDot?
	var spanner: Spanner?
	var pitch: Int
	var tpc: Int
	var played: Bool?
	var fret: Int?
	var string: Int?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Note(
			eid: try node["eid"].value(),
			accidental: try node["Accidental"].value(),
			linkedMain: try node["linkedMain"].value(found: true, notFound: false),
			visible: try node["visible"].value(found: true, notFound: false),
			noteDot: try node[NoteDot.nodeKey].value(),
			spanner: try node[Spanner.nodeKey].value(),
			pitch: try node["pitch"].value(),
			tpc: try node["tpc"].value(),
			played: try node["play"].value(),
			fret: try node["fret"].value(),
			string: try node["string"].value()
		)
	}
}
