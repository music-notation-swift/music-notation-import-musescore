//
//	Text.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Text: XMLObjectDeserialization {
	var eid: Int
	var style: String
	var text: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Text(
			eid: try node["eid"].value(),
			style: try node["style"].value(),
			text: try node["text"].value()
		)
	}
}
