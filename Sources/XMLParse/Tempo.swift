//
//	Tempo.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-12.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Tempo>
//  <tempo>2.933333</tempo>
//  <eid>177150221090863</eid>
//  <text><sym>metNoteQuarterUp</sym> = 176</text>
//</Tempo>

public struct Tempo: XMLObjectDeserialization {
	static let nodeKey = "Tempo"

	var eid: Int
	var text: String
	var tempo: Double

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Tempo(
			eid: try node["eid"].value(),
			text: try node["text"].value(),
			tempo: try node["tempo"].value()
		)
	}
}
