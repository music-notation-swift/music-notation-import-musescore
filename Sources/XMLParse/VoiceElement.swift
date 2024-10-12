//
//	Voice.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public enum VoiceElement: XMLObjectDeserialization {
	case rest(Rest)
	case chord(Chord)
	case timeSignature(TimeSignature)
	case keySignature(KeySignature)

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		guard let element = node.element else { throw VoiceElementError.elementParseError }
		switch element.name {
		case "Rest":
			return .rest(try node.value())
		case "Chord":
			return .keySignature(try node.value())
		case "KeySig":
			return .keySignature(try node.value())
		case "TimeSig":
			return .keySignature(try node.value())
		default:
			throw VoiceElementError.unknownVoiceElementError
		}
	}
}

public enum VoiceElementError: Error {
	case unknownVoiceElementError
	case elementParseError
}
