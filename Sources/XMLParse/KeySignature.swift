//
//	KeySignature.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<KeySig>
//  <eid>167503724567</eid>
//  <linkedMain />
//  <concertKey>0</concertKey>
//</KeySig>

public struct KeySignature: XMLObjectDeserialization {
	static let nodeKey = "KeySig"
	var eid: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		KeySignature(eid: try node["eid"].value())
	}
}
