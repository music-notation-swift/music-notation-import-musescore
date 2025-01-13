//
//	Accidental.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-12.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Accidental>
//  <subtype>accidentalNatural</subtype>
//  <eid>183914794582032</eid>
//</Accidental>


public struct Accidental: XMLObjectDeserialization {
	static let nodeKey = "Accidental"

	var eid: Int
	var subtype: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Accidental(
			eid: try node["eid"].value(),
			subtype: try node["subtype"].value()
		)
	}
}
