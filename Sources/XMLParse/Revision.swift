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
	var value: UInt64

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		guard let revisionValue = UInt64(try node.value() as String, radix: 16) else {
			throw RevisionError.revisionStringConversion
		}
		return Revision(value: revisionValue)
	}
}

public enum RevisionError: Error {
	case revisionStringConversion
}
