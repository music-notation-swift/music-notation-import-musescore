//
//	NearEquatable.swift
//	music-notation-import-guitarpro
//
//	Created by Steven Woolgar on 2025-01-01.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

/// Provides equality testing for enums without considering the contents
/// of the associated types.
public protocol NearEquatable {
	/// Method for evaluating whether the enum is near equal. Ignores the associated types
	func isNearEqual(to: Self) -> Bool
}
