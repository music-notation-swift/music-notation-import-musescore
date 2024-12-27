//
//	SpannerTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-22.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class SpannerTests {
	@Test func hairpin() async throws {
		let xmlString = #"""
<Spanner type="HairPin">
  <HairPin>
    <subtype>2</subtype>
    <endText>et</endText>
    <lineVisible>0</lineVisible>
    <continueText>ct</continueText>
  </HairPin>
  <next>
    <location>
      <measures>18</measures>
    </location>
  </next>
</Spanner>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let hairpinSpanner: Spanner = try xmlParser[Spanner.nodeKey].value()
		#expect(hairpinSpanner.spannerType =~ Spanner.SpannerType.hairpin(Spanner.Hairpin.empty()))

		if case Spanner.SpannerType.hairpin(let hairpin) = hairpinSpanner.spannerType {
			#expect(hairpin.subtype == 2)
			#expect(hairpin.endText == "et")
			#expect(hairpin.continueText == "ct")
		} else {
			#expect(Bool(false))
		}
	}
}
