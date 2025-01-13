//
//	Dynamic.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-12.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Dynamic: XMLObjectDeserialization {
	static let nodeKey = "Dynamic"

	var eid: Int
	var subtype: String
	var velocity: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Dynamic(
			eid: try node["eid"].value(),
			subtype: try node["subtype"].value(),
			velocity: try node["velocity"].value()
		)
	}
}
