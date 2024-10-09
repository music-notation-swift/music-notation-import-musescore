//
//	MuseScoreInterchangeFormat.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import Foundation
import SWXMLHash

// The root element of this is the `<museScore>` element.
public struct MuseScoreInterchangeFormat: XMLObjectDeserialization {
	public var version: Version
	public var revision: Revision

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		try MuseScoreInterchangeFormat(
			version: Version.withString(node["programVersion"].value()),
			revision: Revision.withString(node["programRevision"].value())
		)
	}
}
