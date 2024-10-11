//
//	Instrument.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<instrument id="electric-guitar-tablature">
//  <family id="guitars">Guitars</family>
//</instrument>

public struct Instrument: XMLObjectDeserialization {
	var id: String
	var family: Family

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let attribute: String = try node.value(ofAttribute: "id")

		return try Instrument(
			id: attribute,
			family: node["family"].value()
		)
	}
}

