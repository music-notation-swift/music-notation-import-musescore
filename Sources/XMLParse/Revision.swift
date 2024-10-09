//
//	Revision.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2021-03-30.
//	Copyright © 2021 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Revision: XMLObjectDeserialization {
	var value: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		try Revision(value: node.value())
	}

	static func withString(_ string: String) throws -> Self {
		return Revision(value: 1)
	}
}
