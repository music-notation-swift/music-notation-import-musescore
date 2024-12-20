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
//	  <name>stdNormal</name>
//  </StaffType>
//  <defaultClef>G8vb</defaultClef>
//</Staff>

public struct StaffLink: XMLObjectDeserialization {
	static let nodeKey = "linkedTo"
	var id: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		return StaffLink(id: try node.value())
	}
}
