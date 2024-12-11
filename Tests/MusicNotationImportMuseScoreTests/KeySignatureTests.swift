//
//	KeySignatureTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class KeySignatureTests {
	@Test func parseKeySignature() async throws {
		let xmlString = #"""
		<KeySig>
		  <eid>167503724567</eid>
		  <linkedMain />
		  <concertKey>0</concertKey>
		</KeySig>
		"""#
		let xmlParser = XMLHash.parse(xmlString)
		let instrument: KeySignature = try xmlParser[KeySignature.nodeKey].value()
		#expect(instrument.eid == 167503724567)
//		#expect(instrument.family.id == 167503724567)
	}
}
