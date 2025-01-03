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
<section id="woodwind" brackets="true" barLineSpan="true" thinBrackets="true">
  <family>flutes</family>
  <family>oboes</family>
  <family>clarinets</family>
  <family>saxophones</family>
  <family>bassoons</family>
  <unsorted group="woodwinds" />
</section>
"""#
		let xmlParser = XMLHash.parse(xmlString)

		let section: Section = try xmlParser[Section.nodeKey].value()
		#expect(section.id == "woodwind")
		#expect(section.brackets == true)
		#expect(section.barLineSpan == true)
		#expect(section.thinBrackets == true)
		#expect(section.families.count == 5)
		#expect(section.unsortedFamily == "woodwinds")
	}
}
