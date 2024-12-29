//
//	Rest.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Rest>
//  <eid>1275605286938</eid>
//  <durationType>measure</durationType>
//  <duration>2/4</duration>
//</Rest>

//<Rest>
//  <eid>655094181789722</eid>
//  <durationType>eighth</durationType>
//</Rest>

//<Rest>
//  <eid>655102771724314</eid>
//  <durationType>16th</durationType>
//</Rest>

public struct Rest: XMLObjectDeserialization {
	static let nodeKey = "Rest"
	var eid: Int
	var durationType: DurationType
	var duration: String?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Rest(
			eid: try node["eid"].value(),
			durationType: try node[DurationType.nodeKey].value(),
			duration: try node["duration"].value()
		)
	}
}
