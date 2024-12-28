//
//	StringData.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-27.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<StringData>
//  <frets>24</frets>
//  <string>40</string>
//  <string>45</string>
//  <string>50</string>
//  <string>55</string>
//  <string>59</string>
//  <string>64</string>
//</StringData>

// !INCOMPLETE!
public struct StringData: XMLObjectDeserialization {
	static let nodeKey = "StringData"

	var frets: Int
	var strings: [Int]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		StringData(
			frets: try node["frets"].value(),
			strings: try node["strings"].value()
		)
	}
}
