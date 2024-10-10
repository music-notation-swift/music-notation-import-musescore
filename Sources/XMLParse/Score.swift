//
//	Score.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Score: XMLObjectDeserialization {
	var division: Int
	var showInvisible: Bool
	var showUnprintable: Bool
	var showFrames: Bool
	var showMargins: Bool
	var open: Int
	var metaTags: [MetaTag]
//	var order: Order
//	var part: Part
//	var staves: [Staff]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		try Score(
			division: node["Division"].value(),
			showInvisible: node["showInvisible"].value(),
			showUnprintable: node["showUnprintable"].value(),
			showFrames: node["showFrames"].value(),
			showMargins: node["showMargins"].value(),
			open: node["open"].value(),
			metaTags: ["metaTag"].value()/*,
			order: <#T##<<error type>>#>,
			part: <#T##<<error type>>#>,
			staves: <#T##<<error type>>#>*/
		)
	}
}

//public enum ScoreError: Error {
//}

