//
//	Order.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Order: XMLObjectDeserialization {
	static let nodeKey = "Order"

	var id: String
	var name: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Order(
			id: try node.value(ofAttribute: "id"),
			name: try node["name"].value()
		)
	}
}
