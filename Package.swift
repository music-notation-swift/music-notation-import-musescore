// swift-tools-version:6.0
//
//  Package.swift
//  MusicNotationImportMuseScore
//
//  Created by Steven Woolgar on 2024-10-06.
//  Copyright © 2024 Steven Woolgar. All rights reserved.
//
import PackageDescription

let package = Package(
	name: "music-notation-import-musescore",
	platforms: [.macOS(.v14)],
	products: [.library(name: "MusicNotationImportMuseScore", targets: ["MusicNotationImportMuseScore"])],

	dependencies: [
		.package(url: "https://github.com/music-notation-swift/music-notation.git", from: "0.2.5"),
		.package(url: "https://github.com/drmohundro/SWXMLHash.git", from: "8.0.0"),
		.package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.19")
	],

	targets: [
		.target(
			name: "MusicNotationImportMuseScore",
			dependencies: [
				"SWXMLHash",
				.product(name: "MusicNotation", package: "music-notation"),
				"ZIPFoundation"
			],
			path: "Sources"
		),
		.testTarget(
			name: "MusicNotationImportMuseScoreTests",
			dependencies: ["MusicNotationImportMuseScore"],
			resources: [.copy("TestFiles")]
		)
	],

	swiftLanguageVersions: [ .v6 ]
)
