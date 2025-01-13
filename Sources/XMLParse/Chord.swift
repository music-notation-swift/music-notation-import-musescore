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
//	  <eid>180388626453</eid>
//	  <linkedMain />
//	  <pitch>40</pitch>
//	  <tpc>18</tpc>
//	  <fret>0</fret>
//	  <string>5</string>
//  </Note>
//</Chord>

public struct Chord: XMLObjectDeserialization {
	static let nodeKey = "Chord"

	var eid: Int
	var linkedMain: Bool
	var dots: Int?
	var durationType: DurationType
	var stem: Stem?
	var notes: [Note]

	static func empty() -> Self {
		Chord(
			eid: 0,
			linkedMain: false,
			durationType: .measure,
			notes: [Note(eid: 0, linkedMain: false, visible: false, pitch: 0, tpc: 0)]
		)
	}

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Chord(
			eid: try node["eid"].value(),
			linkedMain: try node["linkedMain"].value(found: true, notFound: false),
			dots: try node["dots"].value(),
			durationType: try node[DurationType.nodeKey].value(),
			stem: try node[Stem.nodeKey].value(),
			notes: try node[Note.nodeKey].value()
		)
	}
}
