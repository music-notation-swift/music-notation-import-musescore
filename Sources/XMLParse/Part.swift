//
//	Part.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Part>
//  <Staff id="1">
//	  <StaffType group="pitched">
//	    <name>stdNormal</name>
//	  </StaffType>
//	  <defaultConcertClef>G8va</defaultConcertClef>
//	  <defaultTransposingClef>G</defaultTransposingClef>
//	  <bracket type="0" span="14" col="0"></bracket>
//	  <barLineSpan>1</barLineSpan>
//	</Staff>
//  <trackName>Flauto piccolo (Piccolo)</trackName>
//  <Instrument>
//	  <longName>Flauto piccolo</longName>
//	  <shortName>Fl. picc.</shortName>
//	  <trackName>Piccolo</trackName>
//	  <minPitchP>74</minPitchP>
//	  <maxPitchP>108</maxPitchP>
//	  <minPitchA>74</minPitchA>
//	  <maxPitchA>105</maxPitchA>
//	  <transposeDiatonic>7</transposeDiatonic>
//	  <transposeChromatic>12</transposeChromatic>
//	  <instrumentId>wind.flutes.flute.piccolo</instrumentId>
//	  <concertClef>G8va</concertClef>
//	  <transposingClef>G</transposingClef>
//	  <Articulation>
//	    <velocity>100</velocity>
//	    <gateTime>100</gateTime>
//	  </Articulation>
//	  <Articulation name="staccatissimo">
//	    <velocity>100</velocity>
//	    <gateTime>33</gateTime>
//	    </Articulation>
//	  <Articulation name="staccato">
//	    <velocity>100</velocity>
//	    <gateTime>50</gateTime>
//	  </Articulation>
//	  <Articulation name="portato">
//	    <velocity>100</velocity>
//	    <gateTime>67</gateTime>
//	  </Articulation>
//	  <Articulation name="tenuto">
//	    <velocity>100</velocity>
//	    <gateTime>100</gateTime>
//	  </Articulation>
//	  <Articulation name="marcato">
//	    <velocity>120</velocity>
//	    <gateTime>67</gateTime>
//	  </Articulation>
//	  <Articulation name="sforzato">
//	    <velocity>150</velocity>
//	    <gateTime>100</gateTime>
//	  </Articulation>
//	  <Articulation name="sforzatoStaccato">
//	    <velocity>150</velocity>
//	    <gateTime>50</gateTime>
//	  </Articulation>
//	  <Articulation name="marcatoStaccato">
//	    <velocity>120</velocity>
//	    <gateTime>50</gateTime>
//	  </Articulation>
//	  <Articulation name="marcatoTenuto">
//	    <velocity>120</velocity>
//	    <gateTime>100</gateTime>
//	  </Articulation>
//	  <Channel>
//	    <controller ctrl="0" value="0"></controller>
//	    <controller ctrl="32" value="17"></controller>
//	    <program value="72"></program>
//	    <synti>Fluid</synti>
//	    <midiPort>2</midiPort>
//	    <midiChannel>2</midiChannel>
//	  </Channel>
//	</Instrument>
//</Part>

public struct Part: XMLObjectDeserialization {
	static let nodeKey = "Part"

	// These are Staves, but they are different from the ones in the rest of the XML file.
	// I suspect that these are pointer references, or a class with a reference to the main staff.
	public struct Staff: XMLObjectDeserialization {
		static let nodeKey = "Staff"

		var id: Int
		var linkedTo: Int
		var staffType: StaffType
		var defaultClef: String?
		var defaultConcertClef: String?
		var defaultTransposingClef: String?
		var bracket: String?
		var barSpanLine: Int?
		var instrument: Instrument?
	}

	// Parts have their own inner Instrument structure.
	public struct Instrument: XMLObjectDeserialization {
		static let nodeKey = "Instrument"

		var longName: String
		var shortName: String
		var trackName: String
		var minPitchP: Int
		var maxPitchP: Int
		var minPitchA: Int
		var maxPitchA: Int
		var instrumentID: String
		var clef: [String]?			// One clef per staff: guitar has treble, bass, tab (I think)
		var singleNoteDynamics: Int
		var stringData: StringData?
		var channels: [Channel]
		var transposeDiatonic: Int?
		var transposeChromatic: Int?
		var concertClef: String?
		var transposingClef: String?
		var articulations: [Articulation]?
	}

	var id: Int

	// A list of Staves that are linked to each other. Like notation+tablature
	var staves: [Part.Staff]

	var trackName: String
	var instrument: Instrument

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let idString: String = try node.value(ofAttribute: "id")
		let id = Int(idString)
		guard let id else { throw PartError.partIdConversionError }

		return Part(
			id: id,
			staves: try node[Part.Staff.nodeKey].value(),
			trackName: try node["name"].value(),
			instrument: try node[Part.Instrument.nodeKey].value()
		)
	}
}

public enum PartError: Error {
	case partIdConversionError
}

