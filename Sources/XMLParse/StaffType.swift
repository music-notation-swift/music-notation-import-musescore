//
//	StaffType.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<StaffType group="pitched">
//  <name>stdNormal</name>
//</StaffType>

public struct StaffType: XMLObjectDeserialization {
	static let nodeKey = "StaffType"
	var group: String
	var name: String
	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let group: String = try node.value(ofAttribute: "group")
		return StaffType(group: group, name: try node["name"].value())
	}
}
