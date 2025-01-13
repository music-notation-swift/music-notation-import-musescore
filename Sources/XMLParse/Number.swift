//
//	Number.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-12.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Number>
//  <style>tuplet</style>
//  <text>3</text>
//</Number>

public struct Number: XMLObjectDeserialization {
	static let nodeKey = "Number"

	var style: String
	var text: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Number(
			style: try node["style"].value(),
			text: try node["text"].value()
		)
	}
}
