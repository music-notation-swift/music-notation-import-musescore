//
//	StringDataTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class StringDataTests {
	@Test func channelParseOpen() async throws {
		let xmlString = #"""
<StringData>
  <frets>24</frets>
  <string>40</string>
  <string>45</string>
  <string>50</string>
  <string>55</string>
  <string>59</string>
  <string>64</string>
</StringData>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let stringData: StringData = try xmlParser[StringData.nodeKey].value()
		#expect(stringData.frets == 24)
		#expect(stringData.strings.count == 6)
		#expect(stringData.strings[0] == 40)
		#expect(stringData.strings[1] == 45)
		#expect(stringData.strings[2] == 50)
		#expect(stringData.strings[3] == 55)
		#expect(stringData.strings[4] == 59)
		#expect(stringData.strings[5] == 64)
	}
}
