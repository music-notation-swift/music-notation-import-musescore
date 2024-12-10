//
//	Chord.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Chord>
//  <eid>176093659252</eid>
//  <linkedMain />
//  <durationType>quarter</durationType>
//  <Note>
//	<eid>180388626453</eid>
//	<linkedMain />
//	<pitch>40</pitch>
//	<tpc>18</tpc>
//	<fret>0</fret>
//	<string>5</string>
//  </Note>
//</Chord>

public struct Chord: XMLObjectDeserialization {
	static let key = "Chord"

	var eid: Int
	var linkedMain: Bool
	var durationType: Duration
	var note: Note

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Chord(
			eid: try node["eid"].value(),
			linkedMain: try node["linkedMain"].value(found: true, notFound: false),
			durationType: try node["durationType"].value(),
			note: try node[Note.key].value()
		)
	}
}
