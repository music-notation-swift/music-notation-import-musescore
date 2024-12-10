//
//	Family.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<instrument id="electric-guitar-tablature">
//  <family id="guitars">Guitars</family>
//</instrument>

public struct Family: XMLObjectDeserialization {
	static let key = "family"
	var id: String?
	var name: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Family(
			id: node.value(ofAttribute: "id"),
			name: try node.value()
		)
	}
}

