//
//	StaffText.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-12.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct StaffText: XMLObjectDeserialization {
	static let nodeKey = "StaffText"

	var eid: Int
	var text: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		StaffText(
			eid: try node["eid"].value(),
			text: try node["text"].value()
		)
	}
}
