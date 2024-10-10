//
//	Revision.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Revision: XMLObjectDeserialization {
	var value: UInt64

	static func withString(_ string: String) throws -> Self {
		guard let revisionValue = UInt64(string, radix: 16) else { throw RevisionError.revisionStringConversion }
		return Revision(value: revisionValue)
	}
}

public enum RevisionError: Error {
	case revisionStringConversion
}
