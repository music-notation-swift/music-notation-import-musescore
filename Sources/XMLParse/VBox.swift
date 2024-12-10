//
//	VBox.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct VBox: XMLObjectDeserialization {
	var eid: Int
	var height: Int
	var texts: [Text]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		VBox(
			eid: try node["eid"].value(),
			height: try node["height"].value(),
			texts: try node[Text.key].value()
		)
	}
}
