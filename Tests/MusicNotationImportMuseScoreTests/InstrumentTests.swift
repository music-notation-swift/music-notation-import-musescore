//
//	InstrumentTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class InstrumentTests {
	@Test func parseInstrument() async throws {
		let xmlParser = XMLHash.parse(#"<instrument id="electric-guitar-tablature"><family id="guitars">Guitars</family></instrument>"#)
		let instrument: Instrument = try xmlParser[Instrument.nodeKey].value()
		#expect(instrument.id == "electric-guitar-tablature")
		#expect(instrument.family.id == "guitars")
	}
}
