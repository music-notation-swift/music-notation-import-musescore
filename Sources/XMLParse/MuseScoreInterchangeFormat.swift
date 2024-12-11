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
	public var lastEID: Int
	public var score: Score

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		try MuseScoreInterchangeFormat(
			version: Version.withString(node[Version.nodeKey].value()),
			revision: Revision.withString(node[Revision.nodeKey].value()),
			lastEID: node["LastEID"].value(),
			score: node[Score.nodeKey].value()
		)
	}
}
