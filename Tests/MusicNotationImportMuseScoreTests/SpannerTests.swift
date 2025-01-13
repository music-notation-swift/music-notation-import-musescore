//
//	SpannerTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-22.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

@Suite final class SpannerTests {
	@Test func hairpin() async throws {
		let xmlString = #"""
<Spanner type="HairPin">
  <HairPin>
 <subtype>2</subtype>
 <endText>et</endText>
 <lineVisible>0</lineVisible>
 <continueText>ct</continueText>
  </HairPin>
  <next>
 <location>
   <measures>18</measures>
 </location>
  </next>
</Spanner>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let hairpinSpanner: Spanner = try xmlParser[Spanner.nodeKey].value()
		#expect(hairpinSpanner.spannerType.isNearEqual(to: Spanner.SpannerType.hairpin(Spanner.Hairpin.empty())))
		#expect(hairpinSpanner.next?.measures == 18)
		#expect(hairpinSpanner.previous == nil)

		if case Spanner.SpannerType.hairpin(let hairpin) = hairpinSpanner.spannerType {
			#expect(hairpin.subtype == 2)
			#expect(hairpin.endText == "et")
			#expect(hairpin.continueText == "ct")
		} else {
			#expect(Bool(false))
		}
	}

	@Test func ottava() async throws {
		let xmlString = #"""
<Spanner type="Ottava">
  <Ottava>
 <subtype>8va</subtype>
  </Ottava>
  <next>
 <location>
   <measures>6</measures>
   <fractions>-5/16</fractions>
 </location>
  </next>
</Spanner>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let ottavaSpanner: Spanner = try xmlParser[Spanner.nodeKey].value()
		#expect(ottavaSpanner.spannerType.isNearEqual(to: Spanner.SpannerType.ottava(Spanner.Ottava.empty())))
		#expect(ottavaSpanner.next?.measures == 6)
		#expect(ottavaSpanner.next?.fractions == "-5/16")
		#expect(ottavaSpanner.previous == nil)

		if case Spanner.SpannerType.ottava(let ottava) = ottavaSpanner.spannerType {
			#expect(ottava?.subtype == "8va")
		} else {
			#expect(Bool(false))
		}
	}

	@Test func slurParse() async throws {
		let xmlString = #"""
<Spanner type="Slur">
  <prev>
 <location>
   <fractions>-1/4</fractions>
 </location>
  </prev>
</Spanner>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let slurSpanner: Spanner = try xmlParser[Spanner.nodeKey].value()
		if case Spanner.SpannerType.slur(let slur) = slurSpanner.spannerType {
			#expect(slur != nil)
		} else {
			#expect(Bool(false))
		}

		#expect(slurSpanner.next == nil)
		#expect(slurSpanner.previous?.fractions == "-1/4")
	}

	@Test func tieParse() async throws {
		let xmlString = #"""
<Spanner type="Tie">
  <Tie>
    <eid>231928234015</eid>
    <linkedMain />
  </Tie>
  <next>
    <location>
      <fractions>1/4</fractions>
    </location>
  </next>
</Spanner>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let tieSpanner: Spanner = try xmlParser[Spanner.nodeKey].value()
		if case Spanner.SpannerType.tie(let tie) = tieSpanner.spannerType {
			#expect(tie != nil)
		} else {
			#expect(Bool(false))
		}

		#expect(tieSpanner.previous == nil)
		#expect(tieSpanner.next?.fractions == "1/4")
	}

	@Test func trillParse() async throws {
		let xmlString = #"""
<Spanner type="Trill">
  <Trill>
	<subtype>trill</subtype>
	<lineWidth>0.24765</lineWidth>
  </Trill>
  <next>
 <location>
   <measures>4</measures>
 </location>
  </next>
</Spanner>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let trillSpanner: Spanner = try xmlParser[Spanner.nodeKey].value()
		if case Spanner.SpannerType.trill(let trill) = trillSpanner.spannerType {
			#expect(trill != nil)
			#expect(trill.subtype == "trill")
			#expect(trill.lineWidth == 0.24765)
		} else {
			#expect(Bool(false))
		}

		#expect(trillSpanner.previous == nil)
		#expect(trillSpanner.next?.measures == 4)
	}

	@Test func voltaParse() async throws {
		let xmlString = #"""
<Spanner type="Volta">
  <Volta>
    <endHookType>1</endHookType>
    <beginText>1.</beginText>
    <endings>1</endings>
  </Volta>
  <next>
	<location>
	  <measures>12</measures>
	</location>
  </next>
</Spanner>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let voltaSpanner: Spanner = try xmlParser[Spanner.nodeKey].value()
		if case Spanner.SpannerType.volta(let volta) = voltaSpanner.spannerType {
			#expect(volta != nil)
			#expect(volta.endHookType == 1)
			#expect(volta.beginText == "1.")
			#expect(volta.endings == "1")
		} else {
			#expect(Bool(false))
		}

		#expect(voltaSpanner.previous == nil)
		#expect(voltaSpanner.next?.measures == 12)
	}
}
