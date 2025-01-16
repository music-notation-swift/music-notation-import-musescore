//
//	Score+Staff.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-15.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

extension Score {
	public func staff(for partStaffId: Int) throws -> Staff {
		guard let staff = staves.first(where: { $0.id == partStaffId })
		else { throw ScoreError.ScoreIdNotFound }

		return staff
	}
}

enum ScoreError: Error {
	case ScoreIdNotFound
}
