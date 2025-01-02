//
//	SectionTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class SectionTests {
	@Test func sectionParse() async throws {
		let xmlString = #"""
<Section name="open">
  <program value="27" />
  <synti>Fluid</synti>
</Section>
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let section: Section = try xmlParser[Section.nodeKey].value()
//		#expect(section.name == "open")
//		#expect(section.program == 27)
//		#expect(section.synthesizer == "Fluid")
	}
}
