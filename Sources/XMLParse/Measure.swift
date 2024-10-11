//
//	Measure.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Measure: XMLObjectDeserialization {
	var voices: [Voice]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Measure(voices: try node["voice"].value())
	}
}
