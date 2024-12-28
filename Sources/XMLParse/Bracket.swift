//
//	Bracket.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-27.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Bracket: XMLObjectDeserialization {
	static let nodeKey = "bracket"

	var type: Int
	var span: Int
	var column: Int
	var visible: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Bracket(
			type: try node.value(ofAttribute: "type"),
			span: try node.value(ofAttribute: "span"),
			column: try node.value(ofAttribute: "col"),
			visible: try node.value(ofAttribute: "visible")
		)
	}
}
