//
//	Section.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Section: XMLObjectDeserialization {
	var id: String
	var brackets: Bool
	var barLineSpan: Bool
	var thinBrackets: Bool
	var families: [Family]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		return try Section(
			id: try node.value(ofAttribute: "id"),
			brackets: try node.value(ofAttribute: "brackets"),
			barLineSpan: try node.value(ofAttribute: "barLineSpan"),
			thinBrackets: try node.value(ofAttribute: "thinBrackets"),
			families: node[Family.nodeKey].value()
		)
	}
}
