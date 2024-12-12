//
//	Location.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-12-12.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<next>
//  <location>
//	  <fractions>1/4</fractions>
//	</location>
//</next>

public struct Location: XMLObjectDeserialization {
	static let nodeKey = "location"

	var fractions: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Location(fractions: try node["fractions"].value())
	}
}
