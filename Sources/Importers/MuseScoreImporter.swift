//
//	MuseScoreImporter.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-08.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import Foundation
import MusicNotation
import SWXMLHash
import ZIPFoundation

public struct MuseScoreImporter {
	public let file: URL
	public let verbose: Bool
	public let lazy: Bool

	public init(file: URL, verbose: Bool, lazy: Bool) {
		self.file = file
		self.verbose = verbose
		self.lazy = lazy
	}

	public func consume() throws -> MusicNotation.Score {
		if verbose { print("--- Starting parsing of: \(file) ---") }
		defer { if verbose { print("--- Ending parsing of: \(file) ---") } }

		var xmlString = ""

		if file.pathExtension == "mscz" {
			let filename = (file.lastPathComponent as NSString).deletingPathExtension
			guard let archive = try? Archive(url: file, accessMode: .read, pathEncoding: nil) else { throw MuseScoreImportError(file: file, "Could not open gp archive") }
			guard let scoreEntry = archive["\(filename).mscx"] else { throw MuseScoreImportError(file: file, "Could not open XML file inside mscz archive") }

			xmlString = try unzipToString(archive, entry: scoreEntry)
		}

		return try createNotation(with: try parseXML(xmlString))
	}

	func unzipToString(_ archive: Archive, entry: Entry) throws -> String {
		var xmlData = Data()

		_ = try archive.extract(entry, consumer: { data in
			xmlData.append(data)
		})

		guard let string = String(data: xmlData, encoding: .utf8) else { throw MuseScoreImportError(file: file, "Could not convert data from archive to string") }
		return string
	}

	func unzipToData(_ archive: Archive, entry: Entry) throws -> Data {
		var entryData = Data()

		_ = try archive.extract(entry, consumer: { data in
			entryData.append(data)
		})

		return entryData
	}

	// Parse the XML of the score
	func parseXML(_ xmlString: String) throws -> MusicNotationImportMuseScore.MuseScoreInterchangeFormat {
		let xml = XMLHash.config { config in
			config.shouldProcessLazily = lazy
			config.detectParsingErrors = true
		}.parse(xmlString)

		return try xml["museScore"].value()
	}

	public func createNotation(with interchangeFormat: MusicNotationImportMuseScore.MuseScoreInterchangeFormat) throws -> MusicNotation.Score {
		return MusicNotation.Score()
	}
}

public struct MuseScoreImportError: Error, CustomStringConvertible {
	public internal(set) var file: URL
	public internal(set) var message: String

	/// Creates a new validation error with the given message.
	public init(file: URL, _ message: String) {
		self.file = file
		self.message = message
	}

	public var description: String { message }
}
