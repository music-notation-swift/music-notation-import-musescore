//
//	StaffLink.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Staff id="1">
//  <linkedTo>2</linkedTo>
//  <StaffType group="pitched">
//	<name>stdNormal</name>
//  </StaffType>
//  <defaultClef>G8vb</defaultClef>
//</Staff>

public struct StaffLink: XMLObjectDeserialization {
	static let nodeKey = "linkedTo"
	var id: Int
	var staffLink: Int
	var name: String
	var staffType: StaffType
	var defaultClef: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let attributeString: String = try node.value(ofAttribute: "id")
		let attribute = Int(attributeString)

		guard let attribute else { throw StaffLinkError.staffLinkIdConversionError }
		return StaffLink(
			id: attribute,
			staffLink: try node["staffLink"].value(),
			name: try node["name"].value(),
			staffType: try node[StaffType.nodeKey].value(),
			defaultClef: try node["defaultClef"].value()
		)
	}
}

public enum StaffLinkError: Error {
	case staffLinkIdConversionError
}

