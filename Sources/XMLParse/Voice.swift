//
//	Voice.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Voice: XMLObjectDeserialization {
	static let nodeKey = "voice"
	var rests: [Rest]?
	var chords: [Chord]?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Voice(
			rests: try node[Rest.nodeKey].value(),
			chords: try node["Chord"].value()
		)
	}
}
