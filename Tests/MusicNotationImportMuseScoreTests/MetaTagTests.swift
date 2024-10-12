//
//	MetaTagTests.swift
//	music-notation-import-guitarpro-tests
//
//	Created by Steven Woolgar on 2021-02-10.
//	Copyright © 2021 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class MetaTagTests {
	let xmlToParse = """
  <root>
   <open>1</open>
   <metaTag name="arranger">test arranger</metaTag>
   <metaTag name="composer">Composer / arranger</metaTag>
   <metaTag name="copyright"></metaTag>
   <metaTag name="creationDate">2024-07-15</metaTag>
   <metaTag name="lyricist"></metaTag>
   <metaTag name="movementNumber"></metaTag>
   <metaTag name="movementTitle"></metaTag>
   <metaTag name="platform">Apple Macintosh</metaTag>
   <metaTag name="source"></metaTag>
   <metaTag name="subtitle">Subtitle</metaTag>
   <metaTag name="translator"></metaTag>
   <metaTag name="workNumber"></metaTag>
   <metaTag name="workTitle">Untitled score</metaTag>
   <Order id="orchestral">
  </root>
 """
	var xml: XMLIndexer?

	init() {
		// Put setup code here. This method is called before the invocation of each test method in the class.

		xml = XMLHash.parse(xmlToParse)
	}

	deinit {
		xml = nil
	}

	@Test func shouldBeAbleToParseIndividualMetaTags() async throws {
		#expect(try xml!["root"]["metaTag"][0].value(ofAttribute: "name") == "arranger")
	}

	@Test func shouldBeAbleToParseArrayOfMetaTags() async throws {
		let metaTags: [MetaTag] = try xml!["root"]["metaTag"].value()
		#expect(metaTags.count == 13)
		#expect(try xml!["root"]["metaTag"].all.count == 13)
	}
}
