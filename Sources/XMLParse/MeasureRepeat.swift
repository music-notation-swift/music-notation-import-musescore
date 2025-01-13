//
//	MeasureRepeat.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-13.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<MeasureRepeat>
//  <subtype>1</subtype>
//  <eid>119954141610014</eid>
//  <durationType>measure</durationType>
//  <duration>4/4</duration>
//</MeasureRepeat>

public struct MeasureRepeat: XMLObjectDeserialization {
	static let nodeKey = "MeasureRepeat"

	var eid: Int
	var subtype: String
	var durationType: DurationType
	var duration: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		MeasureRepeat(
			eid: try node["eid"].value(),
			subtype: try node["subtype"].value(),
			durationType: try node["durationType"].value(),
			duration: try node["duration"].value()
		)
	}
}
