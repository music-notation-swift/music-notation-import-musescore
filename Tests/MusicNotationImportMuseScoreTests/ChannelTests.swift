//
//	ChannelTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-28.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class ChannelTests {
	@Test func channelParseOpen() async throws {
		let xmlString = #"""
<Channel name="open">
  <program value="27" />
  <synti>Fluid</synti>
</Channel>
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let channel: Channel = try xmlParser[Channel.nodeKey].value()
		#expect(channel.name == "open")
		#expect(channel.program == 27)
		#expect(channel.synthesizer == "Fluid")
	}

	@Test func channelParseMute() async throws {
		let xmlString = #"""
<Channel name="mute">
  <program value="28" />
  <synti>Fluid</synti>
</Channel>
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let channel: Channel = try xmlParser[Channel.nodeKey].value()
		#expect(channel.name == "mute")
		#expect(channel.program == 28)
		#expect(channel.synthesizer == "Fluid")
	}

	@Test func channelParseJazz() async throws {
		let xmlString = #"""
<Channel name="jazz">
  <program value="26" />
  <synti>Fluid</synti>
</Channel>
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let channel: Channel = try xmlParser[Channel.nodeKey].value()
		#expect(channel.name == "jazz")
		#expect(channel.program == 26)
		#expect(channel.synthesizer == "Fluid")
	}

	@Test func channelParseControllers() async throws {
		let xmlString = #"""
<Channel>
  <controller ctrl="0" value="1" />
  <controller ctrl="32" value="17" />
  <program value="72" />
  <synti>Fluid</synti>
  <midiPort>2</midiPort>
  <midiChannel>3</midiChannel>
</Channel>
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let channel: Channel = try xmlParser[Channel.nodeKey].value()
		#expect(channel.name == nil)
		#expect(channel.program == 72)
		#expect(channel.synthesizer == "Fluid")
		#expect(channel.midiPort == 2)
		#expect(channel.midiChannel == 3)

		#expect(channel.controllers?.count == 2)
		#expect(channel.controllers?[0].ctrl == 0)
		#expect(channel.controllers?[0].value == 1)
		#expect(channel.controllers?[1].ctrl == 32)
		#expect(channel.controllers?[1].value == 17)
	}
}
