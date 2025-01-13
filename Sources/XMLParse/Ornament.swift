//
//	Ornament.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-13.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Ornament>
//  <subtype>ornamentTrill</subtype>
//  <eid>75810467741729</eid>
//</Ornament>

public struct Ornament: XMLObjectDeserialization, Sendable {
	static let nodeKey = "Ornament"

	var eid: Int?
	var subtype: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Ornament(
			eid: try node["eid"].value(),
			subtype: try node["subtype"].value()
		)
	}
}
