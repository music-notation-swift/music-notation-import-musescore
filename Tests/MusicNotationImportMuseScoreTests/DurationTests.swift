//
//	DurationsTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class DurationsTests {
	@Test func quarterDuration() async throws {
		let xmlParser = XMLHash.parse("<durationType>quarter</durationType>")
		let duration: Duration = try xmlParser["durationType"].value()
		#expect(duration == .quarter)
	}

	@Test func halfDuration() async throws {
		let xmlParser = XMLHash.parse("<durationType>half</durationType>")
		let duration: Duration = try xmlParser["durationType"].value()
		#expect(duration == .half)
	}

	@Test func measureDuration() async throws {
		let xmlParser = XMLHash.parse("<durationType>measure</durationType>")
		let duration: Duration = try xmlParser["durationType"].value()
		#expect(duration == .measure)
	}

	@Test func badDuration() async throws {
		let xmlParser = XMLHash.parse("<durationType>bad</durationType>")
		#expect(throws: DurationParseError.self) {
			_  = try xmlParser["durationType"].value() as Duration
		}
	}
}
