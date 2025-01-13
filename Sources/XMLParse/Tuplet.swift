//
//	Tuplet.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-12.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Tuplet>
//  <eid>313532612654</eid>
//  <normalNotes>2</normalNotes>
//  <actualNotes>3</actualNotes>
//  <baseNote>eighth</baseNote>
//  <Number>
//	  <style>tuplet</style>
//	  <text>3</text>
//	</Number>
//</Tuplet>

public struct Tuplet: XMLObjectDeserialization {
	static let nodeKey = "Tuplet"

	var eid: Int
	var normalNotes: Int
	var actualNotes: Int
	var baseNote: String
	var number: Number

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Tuplet(
			eid: try node["eid"].value(),
			normalNotes: try node["normalNotes"].value(),
			actualNotes: try node["actualNotes"].value(),
			baseNote: try node["baseNote"].value(),
			number: try node["Number"].value()
		)
	}
}
