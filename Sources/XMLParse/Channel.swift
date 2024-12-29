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

public struct Channel: XMLObjectDeserialization {
	static let nodeKey = "Channel"

	var name: String?
	var program: Int
	var synthesizer: String
	var controllers: [ChannelController]?
	var midiPort: Int?
	var midiChannel: Int?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Channel(
			name: node.value(ofAttribute: "name"),
			program: try node["program"].value(ofAttribute: "value"),
			synthesizer: try node["synti"].value(),
			controllers: try node[ChannelController.nodeKey].value(),
			midiPort: try node["midiPort"].value(),
			midiChannel: try node["midiChannel"].value()
		)
	}
}

public struct ChannelController: XMLObjectDeserialization {
	static let nodeKey = "controller"

	var ctrl: Int
	var value: Int

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		ChannelController(
			ctrl: try node.value(ofAttribute: "ctrl"),
			value: try node.value(ofAttribute: "value")
		)
	}
}
