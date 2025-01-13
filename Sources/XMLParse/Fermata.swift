//
//	Fermata.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-13.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Fermata>
//  <subtype>fermataAbove</subtype>
//  <eid>177158811025442</eid>
//</Fermata>

public struct Fermata: XMLObjectDeserialization, Sendable {
	static let nodeKey = "Fermata"

	var eid: Int
	var subtype: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Fermata(
			eid: try node["eid"].value(),
			subtype: try node["subtype"].value()
		)
	}
}
