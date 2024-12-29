//
//	DurationTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class DurationTypeTests {
	@Test func quarterDuration() async throws {
		let xmlParser = XMLHash.parse("<durationType>quarter</durationType>")
		let duration: DurationType = try xmlParser[DurationType.nodeKey].value()
		#expect(duration == .quarter)
	}

	@Test func halfDurationType() async throws {
		let xmlParser = XMLHash.parse("<durationType>half</durationType>")
		let duration: DurationType = try xmlParser[DurationType.nodeKey].value()
		#expect(duration == .half)
	}

	@Test func measureDurationType() async throws {
		let xmlParser = XMLHash.parse("<durationType>measure</durationType>")
		let duration: DurationType = try xmlParser[DurationType.nodeKey].value()
		#expect(duration == .measure)
	}

	@Test func badDurationType() async throws {
		let xmlParser = XMLHash.parse("<durationType>bad</durationType>")
		#expect(throws: DurationTypeParseError.self) {
			_ = try xmlParser[DurationType.nodeKey].value() as DurationType
		}
	}
}
