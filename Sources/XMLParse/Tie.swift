//
//	Tie.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-12-12.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Tie>
//   <eid>231928234015</eid>
//   <linkedMain />
//</Tie>

public struct Tie: XMLObjectDeserialization {
	static let nodeKey = "Tie"

	var eid: Int
	var linkedMain: Bool

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Tie(
			eid: try node["eid"].value(),
			linkedMain: try node["linkedMain"].value(found: true, notFound: false)
		)
	}
}
