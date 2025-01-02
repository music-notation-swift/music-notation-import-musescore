//
//	Revision.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Revision: XMLObjectDeserialization {
	static let nodeKey = "programRevision"
	var value: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		return Revision(value: try node.value())
	}
}

public enum RevisionError: Error {
	case revisionStringConversion
}
