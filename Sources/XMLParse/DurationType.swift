//
//	DurationType.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-12.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<durationType>quarter</durationType>

public enum DurationType: XMLObjectDeserialization {
	static let nodeKey = "durationType"
	case eighth
	case quarter
	case half
	case measure

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let propertyAttribute: String = try node.value()
		switch propertyAttribute {
		case "eighth":
			return .eighth
		case "quarter":
			return .quarter
		case "half":
			return .half
		case "measure":
			return .measure
		default:
			throw DurationTypeParseError.unsupportedDurationType
		}
	}
}

public enum DurationTypeParseError: Error {
	case unsupportedDurationType
}
