//
//	VoiceElement.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

// These appears in the <voice> (see MeasureVoice) tag.
public enum VoiceElement: XMLObjectDeserialization {
	static let nodeKey = "voice"

	case rest(Rest)
	case chord(Chord)
	case timeSignature(TimeSignature)
	case keySignature(KeySignature)

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		guard let element = node.element else { throw VoiceElementError.elementParseError }
		switch element.name {
		case Rest.nodeKey:
			return .rest(try node.value())
		case Chord.nodeKey:
			return .chord(try node.value())
		case KeySignature.nodeKey:
			return .keySignature(try node.value())
		case TimeSignature.nodeKey:
			return .timeSignature(try node.value())
		default:
			throw VoiceElementError.unknownVoiceElementError
		}
	}
}

// Case Equality. In this case it means the enums are equal, but the associated values are ignored
extension VoiceElement: NearEquatable {
	public func isNearEqual(to: VoiceElement) -> Bool {
		switch (self, to) {
		case (.rest(_), .rest(_)):
			return true
		case (.chord(_), .chord(_)):
			return true
		case (.keySignature(_), .keySignature(_)):
			return true
		case (.timeSignature(_), .timeSignature(_)):
			return true
		default:
			return false
		}
	}
}

public enum VoiceElementError: Error {
	case unknownVoiceElementError
	case elementParseError
}
