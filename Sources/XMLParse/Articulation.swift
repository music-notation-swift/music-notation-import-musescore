//
//	Articulation.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-27.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Articulation>
//  <velocity>100</velocity>
//  <gateTime>100</gateTime>
//</Articulation>
//<Articulation name="staccatissimo">
//  <velocity>100</velocity>
//  <gateTime>33</gateTime>
//</Articulation>
//<Articulation name="staccato">
//  <velocity>100</velocity>
//  <gateTime>50</gateTime>
//</Articulation>

public struct Articulation: XMLObjectDeserialization {
	static let nodeKey = "Articulation"

	var name: String?
	var velocity: Int
	var gateTime: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Articulation(
			name: node.value(ofAttribute: "name"),
			velocity: try node["velocity"].value(),
			gateTime: try node["gateTime"].value()
		)
	}
}
