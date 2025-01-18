//
//	MetaTag.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<root>
// <open>1</open>
// <metaTag name="arranger">test arranger</metaTag>
// <metaTag name="composer">Composer / arranger</metaTag>
// <metaTag name="copyright"></metaTag>
// <metaTag name="creationDate">2024-07-15</metaTag>
// <metaTag name="lyricist"></metaTag>
// <metaTag name="movementNumber"></metaTag>
// <metaTag name="movementTitle"></metaTag>
// <metaTag name="platform">Apple Macintosh</metaTag>
// <metaTag name="source"></metaTag>
// <metaTag name="subtitle">Subtitle</metaTag>
// <metaTag name="translator"></metaTag>
// <metaTag name="workNumber"></metaTag>
// <metaTag name="workTitle">Untitled score</metaTag>
// <Order id="orchestral">
//</root>

public enum MetaTag: XMLObjectDeserialization {
	static let nodeKey = "metaTag"

	case arranger(String)
	case composer(String)
	case copyright(String)
	case creationDate(String)
	case lyricist(String)
	case movementNumber(String)
	case movementTitle(String)
	case originalFormat(String)
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
			return .arranger(try node.value())
		case "composer":
			return .composer(try node.value())
		case "copyright":
			return .copyright(try node.value())
		case "creationDate":
			return .creationDate(try node.value())
		case "lyricist":
			return .lyricist(try node.value())
		case "movementNumber":
			return .movementNumber(try node.value())
		case "movementTitle":
			return .movementTitle(try node.value())
		case "originalFormat":
			return .originalFormat(try node.value())
		case "platform":
			return .platform(try node.value())
		case "source":
			return .source(try node.value())
		case "subtitle":
			return .subtitle(try node.value())
		case "translator":
			return .translator(try node.value())
		case "workNumber":
			return .workNumber(try node.value())
		case "workTitle":
			return .workTitle(try node.value())
		default:
			throw MetaTagParseError.unsupportedPropertyAttribute(propertyAttribute)
		}
	}
}

public enum MetaTagParseError: Error {
	case unsupportedPropertyAttribute(String)
}
