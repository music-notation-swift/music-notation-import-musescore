//
//	TimeSignature.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct TimeSignature: XMLObjectDeserialization {
	static let nodeKey = "TimeSig"
	var eid: Int
	var numerator: Int
	var denominator: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		TimeSignature(
			eid: try node["eid"].value(),
			numerator: try node["sigN"].value(),
			denominator: try node["sigD"].value()
		)
	}
}
