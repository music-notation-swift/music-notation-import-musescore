//
//	NoteDot.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-12-29.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<NoteDot>
//  <eid>485541757845589</eid>
//  <visible>0</visible>
//</NoteDot>

public struct NoteDot: XMLObjectDeserialization {
	static let nodeKey = "NoteDot"

	var eid: Int
	var visible: Bool?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		NoteDot(
			eid: try node["eid"].value(),
			visible: try node["visible"].value(found: true, notFound: false)
		)
	}
}
