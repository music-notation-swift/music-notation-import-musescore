//
//	Spanner.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-12-12.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//  <Spanner type="Tie">
//	  <Tie>
//	    <eid>231928234015</eid>
//	    <linkedMain />
//	  </Tie>
//	  <next>
//	    <location>
//	      <fractions>1/4</fractions>
//	    </location>
//    </next>
//</Spanner>

public struct Spanner: XMLObjectDeserialization {
	static let nodeKey = "Spanner"

	enum SpannerType {
		case tie
	}

	var tie: Tie
	var next: Location

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		Spanner(
			tie: try node[Tie.nodeKey].value(),
			next: try node[Location.nodeKey].value()
		)
	}
}
