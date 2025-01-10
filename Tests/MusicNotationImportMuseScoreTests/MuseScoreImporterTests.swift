//
//	MuseScoreImporterTests.swift
//	music-notation-import-guitarpro-tests
//
//	Created by Steven Woolgar on 2024-10-14.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import Foundation
import SWXMLHash
import System
import Testing
import ZIPFoundation

@Suite final class MuseScoreImporterTests {
	@Test(arguments: ["Test1.mscz", "Test1.mscx"])
	func initTest(filename: String) async throws {
		let filenamePath = FilePath(filename)
		guard let filePath = Bundle.module.path(
			forResource: filenamePath.stem,
			ofType: filenamePath.extension,
			inDirectory: "TestFiles"
		) else {
			Issue.record("Bundle path not found (\(filename))")
			return
		}

		let filePathURL = URL(fileURLWithPath: filePath)
		let importer = MuseScoreImporter(
			file: filePathURL,
			verbose: false,
			lazy: false
		)

		#expect(importer.file == filePathURL)
	}

	@Test func unzipToString() async throws {
		let filePathURL = try filePathURL(from: "testzip.zip")
		let importer = MuseScoreImporter(
			file: filePathURL,
			verbose: false,
			lazy: false
		)

		guard let archive = try? Archive(url: filePathURL, accessMode: .read, pathEncoding: nil)
		else { throw MuseScoreImportError(file: filePathURL, "Could not open gp archive") }
		guard let zipEntry = archive["testzip.txt"]
		else { throw MuseScoreImportError(file: filePathURL, "Could not open XML file inside mscz archive") }

		#expect(try importer.unzipToString(archive, entry: zipEntry) == "testzip")
	}

	@Test(arguments: ["Test1.mscz", "Test1.mscx"])
	func createStringFromFileTest(filename: String) async throws {
		let importer = try importer(from: filename)
		#expect(try importer.createStringFromFile() != "")
	}

	@Test(arguments: ["Test1.bad"])
	func createStringFromBadFileTest(filename: String) async throws {
		let importer = try importer(from: filename)
		#expect(throws: MuseScoreImporterError.self) {
			_ = try importer.createStringFromFile()
		}
	}

	@Test func parseXML() async throws {
		let importer = try importer(from: "Test1.mscx")
		let xmlString = try importer.createStringFromFile()
		let interchangeFormat = try importer.parseXML(xmlString)
		print("\(interchangeFormat)")
		#expect(interchangeFormat.score.staves.count > 0)
	}

	func filePathURL(from filename: String) throws -> URL {
		let filenamePath = FilePath(filename)
		guard let filePath = Bundle.module.path(
			forResource: filenamePath.stem,
			ofType: filenamePath.extension,
			inDirectory: "TestFiles"
		) else {
			Issue.record("Bundle path not found (\(filename))")
			throw MuseScoreImporterTestError.generalFailure
		}

		return URL(fileURLWithPath: filePath)
	}

	func importer(from filename: String) throws -> MuseScoreImporter {
		let fileURL = try filePathURL(from: filename)
		return MuseScoreImporter(
			file: fileURL,
			verbose: false,
			lazy: false
		)
	}
}

enum MuseScoreImporterTestError: Error {
	case generalFailure
}
