//
//	MetaTag.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public enum MetaTag: XMLObjectDeserialization {
	case arranger(String)
	case composer(String)
	case copyright(String)
	case creationDate(String)
	case lyricist(String)
	case movementNumber(String)
	case movementTitle(String)
	case platform(String)
	case source(String)
	case subtitle(String)
	case translator(String)
	case workNumber(String)
	case workTitle(String)

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let propertyAttribute: String = try node.value(ofAttribute: "name")
		switch propertyAttribute {
		case "arranger":
			return .arranger(try node["arranger"].value())
		case "composer":
			return .composer(try node["composer"].value())
		case "copyright":
			return .copyright(try node["copyright"].value())
		case "creationDate":
			return .creationDate(try node["creationDate"].value())
		case "lyricist":
			return .lyricist(try node["lyricist"].value())
		case "movementNumber":
			return .movementNumber(try node["movementNumber"].value())
		case "movementTitle":
			return .movementTitle(try node["movementTitle"].value())
		case "platform":
			return .platform(try node["platform"].value())
		case "source":
			return .source(try node["source"].value())
		case "subtitle":
			return .subtitle(try node["subtitle"].value())
		case "translator":
			return .translator(try node["translator"].value())
		case "workNumber":
			return .workNumber(try node["workNumber"].value())
		case "workTitle":
			return .workTitle(try node["workTitle"].value())
		default:
			throw MetaTagParseError.unsupportedPropertyAttribute(propertyAttribute)
		}
	}
}

public enum MetaTagParseError: Error {
	case unsupportedPropertyAttribute(String)
}
