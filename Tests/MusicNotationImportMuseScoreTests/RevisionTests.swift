//
//	RevisionTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-31.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class RevisionTests {
	@Test func revisionParse() async throws {
		let xmlParser = XMLHash.parse("<programRevision>2232670</programRevision>")

		let revision: Revision = try xmlParser[Revision.nodeKey].value()
		#expect(revision.value == 35858032)
	}
}
