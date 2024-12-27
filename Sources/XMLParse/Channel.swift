//
//	Channel.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-27.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Channel name="open">
//  <program value="27" />
//  <synti>Fluid</synti>
//</Channel>
//<Channel name="mute">
//  <program value="28" />
//  <synti>Fluid</synti>
//</Channel>
//<Channel name="jazz">
//  <program value="26" />
//  <synti>Fluid</synti>
//</Channel>

//<Channel>
//  <controller ctrl="0" value="0" />
//  <controller ctrl="32" value="17" />
//  <program value="72" />
//  <synti>Fluid</synti>
//  <midiPort>2</midiPort>
//  <midiChannel>2</midiChannel>
//</Channel>

// INCOMPLETE
public struct Channel: XMLObjectDeserialization {
	static let nodeKey = "Channel"

	var program: Int
	var synthesizer: String
	var controller: (Int, Int)?
	var midiPort: Int?
	var midiChannel: Int?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Channel(
			program: try node["program"].value(),
			synthesizer: try node["synti"].value(),
			controller: nil,
			midiPort: try node["midiPort"].value(),
			midiChannel: try node["midiChannel"].value()
		)
	}
}
