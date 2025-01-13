//
//	Location.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-12-12.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//  <location>
//	  <fractions>1/4</fractions>
//	</location>

//  <location>
//    <measures>1</measures>
//	  <fractions>-1/4</fractions>
//	</location>

public struct Location: XMLObjectDeserialization, Sendable {
	static let nodeKey = "location"

	var measures: Int?
	var fractions: String?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Location(
			measures: try node["measures"].value(),
			fractions: try node["fractions"].value()
		)
	}
}

public enum LocationParsingError: Error {
	case locationValidationFailure
}
