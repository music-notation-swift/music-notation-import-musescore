//
//	Stem.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-29.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Stem>
//  <eid>485533167910930</eid>
//  <visible>0</visible>
//</Stem>

public struct Stem: XMLObjectDeserialization {
	static let nodeKey = "Stem"

	var eid: Int
	var visible: Bool

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Stem(
			eid: try node["eid"].value(),
			visible: try node["linkedMain"].value(found: true, notFound: false)
		)
	}
}
