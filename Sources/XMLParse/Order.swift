//
//	Order.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Order: XMLObjectDeserialization {
	var id: String
	var name: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let attribute: String = try node.value(ofAttribute: "id")

		return try Order(
			id: attribute,
			name: node["name"].value()
		)
	}
}
