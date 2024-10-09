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

		var xmlString: String

		switch file.pathExtension {
		case "mscz":
			guard let string = try? String(contentsOf: file) else { throw MuseScoreImportError(file: file, "Could not open gpif file") }
			xmlString = string
			partConfigurationsData = Data()

			xmlString = ""
		}

		let notation = try createNotation(
			with: try parseXML(xmlString),
		)

		return notation
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

		return try xml["GPIF"].value()
	}

	public func createNotation(
		with interchangeFormat: MusicNotationImportMuseScore.MuseScoreInterchangeFormat,
		partConfigurations: [PartConfiguration]
	) throws -> MusicNotation.Score {
		let parts = interchangeFormat.tracks.map { track in
			MusicNotation.Part(with: track)
		}

		// Collect score field names

		return MusicNotation.Score(
			parts: parts,
			title: interchangeFormat.score.title,
			subtitle: interchangeFormat.score.subtitle,
			artist: interchangeFormat.score.artist,
			album: interchangeFormat.score.album,
			words: interchangeFormat.score.words,
			wordsAndMusic: interchangeFormat.score.wordsAndMusic,
			transcriber: interchangeFormat.score.tabber,
			instructions: interchangeFormat.score.instructions,
			notices: interchangeFormat.score.notices
		)
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
