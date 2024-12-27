//
//	Box.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-27.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Box: XMLObjectDeserialization {
	enum BoxType {
		case horizontalFrame
		case verticalFrame
		case textFrame
		case fretboardDiagram
	}

	var eid: Int
	var height: Int
	var texts: [Text]?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Box(
			eid: try node["eid"].value(),
			height: try node["height"].value(),
			texts: try node[Text.nodeKey].value()
		)
	}
}
