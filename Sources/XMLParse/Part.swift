//
//	Part.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Part: XMLObjectDeserialization {
	var id: Int
	var staffStubs: [StaffLink]
	var trackName: String
	var instrument: Instrument

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let idString: String = try node.value(ofAttribute: "id")
		let id = Int(idString)
		guard let id else { throw PartError.partIdConversionError }

		return Part(
			id: id,
			staffStubs: try node["linkedTo"].value(),
			trackName: try node["name"].value(),
			instrument: try node["instrument"].value()
		)
	}
}

public enum PartError: Error {
	case partIdConversionError
}

