//
//	ScoreTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import Foundation
import SWXMLHash
import System
import Testing

@Suite final class ScoreTests {
	@Test func scoreParse() async throws {
		let filenamePath = FilePath("ScoreTest.xml")
		guard let filePath = Bundle.module.path(
			forResource: filenamePath.stem,
			ofType: filenamePath.extension,
			inDirectory: "TestFiles"
		) else {
			Issue.record("Bundle path not found")
			return
		}

		let xmlString = try String(contentsOf: URL(fileURLWithPath: filePath))

		let xmlParser = XMLHash.parse(xmlString)
		let score: Score = try xmlParser[Score.nodeKey].value()
		#expect(score.division == 480)
		#expect(score.showInvisible == true)
		#expect(score.showUnprintable == true)
		#expect(score.showFrames == true)
		#expect(score.showMargins == false)
		#expect(score.open == 1)
		#expect(score.metaTags.count == 13)
		#expect(score.order.id == "orchestral")
		#expect(score.parts.count == 2)
		#expect(score.parts[0].id == 1)
		#expect(score.parts[1].id == 2)
		#expect(score.staves.count == 2)
		#expect(score.staves[0].id == 1)
		#expect(score.staves[1].id == 2)
	}

	@Test func scoreParseMetaTagAccess() async throws {
		let filenamePath = FilePath("ScoreMetaTagTest.xml")
		guard let filePath = Bundle.module.path(
			forResource: filenamePath.stem,
			ofType: filenamePath.extension,
			inDirectory: "TestFiles"
		) else {
			Issue.record("Bundle path not found")
			return
		}

		let xmlString = try String(contentsOf: URL(fileURLWithPath: filePath))
		let xmlParser = XMLHash.parse(xmlString)
		let score: Score = try xmlParser[Score.nodeKey].value()
		#expect(score.title() == "Untitled score")
		#expect(score.subtitle() == "Subtitle")
		#expect(score.arranger() == "arranger")
		#expect(score.composer() == "Composer / arranger")
		#expect(score.copyright() == "copyright")
		#expect(score.creationDate() == "2025-01-13")
		#expect(score.lyricist() == "lyricist")
		#expect(score.movementNumber() == "movementNumber")
		#expect(score.movementTitle() == "movementTitle")
		#expect(score.platform() == "Apple Macintosh")
		#expect(score.source() == "source")
		#expect(score.translator() == "translator")
		#expect(score.workNumber() == "workNumber")
		#expect(score.workTitle() == "Untitled score")
	}
}
