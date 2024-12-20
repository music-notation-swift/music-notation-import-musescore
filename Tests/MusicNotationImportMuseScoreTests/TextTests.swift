//
//	TextTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-17.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

//<Text>
//  <eid>8589934597</eid>
//  <style>title</style>
//  <text>FAR BEYOND THE SUN</text>
//</Text>

@Suite final class TextTests {
	@Test func textParse() async throws {
		let xmlString = #"""
<Text>
  <eid>8589934597</eid>
  <style>title</style>
  <text>FAR BEYOND THE SUN</text>
</Text>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let text: Text = try xmlParser[Text.nodeKey].value()
		#expect(text.eid == 8589934597)
		#expect(text.style == "title")
		#expect(text.text == "FAR BEYOND THE SUN")
	}
}
