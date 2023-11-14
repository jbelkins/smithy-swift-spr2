//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Date
import enum SmithyTimestamps.TimestampFormat

public typealias WriterClosure<T> = (T?, Writer) throws -> Void

public func mapWritingClosure<T>(
    valueWritingClosure: @escaping WriterClosure<T>,
    keyNodeInfo: NodeInfo, valueNodeInfo:
    NodeInfo, isFlattened: Bool
) -> WriterClosure<[String: T]> {
    return { map, writer in
        try writer.writeMap(map, valueWritingClosure: valueWritingClosure, keyNodeInfo: keyNodeInfo, valueNodeInfo: valueNodeInfo, isFlattened: isFlattened)
    }
}

public func listWritingClosure<T>(
    memberWritingClosure: @escaping WriterClosure<T>,
    memberNodeInfo: NodeInfo,
    isFlattened: Bool
) -> WriterClosure<[T]> {
    return { array, writer in
        try writer.writeList(array, memberWritingClosure: memberWritingClosure, memberNodeInfo: memberNodeInfo, isFlattened: isFlattened)
    }
}

public func timestampWritingClosure(memberNodeInfo: NodeInfo, format: TimestampFormat) -> WriterClosure<Date> {
    return { date, writer in
        try writer.writeTimestamp(date, format: format)
    }
}

public extension String {

    static func writingClosure(_ value: String?, to writer: Writer) throws {
        try writer.write(value)
    }
}

public extension RawRepresentable where RawValue == Int {

    static func writingClosure(_ value: Self?, to writer: Writer) throws {
        try writer.write(value?.rawValue)
    }
}

public extension RawRepresentable where RawValue == String {

    static func writingClosure(_ value: Self?, to writer: Writer) throws {
        try writer.write(value?.rawValue)
    }
}

public extension Bool {

    static func writingClosure(_ value: Bool?, to writer: Writer) throws {
        try writer.write(value)
    }
}

public extension Int {

    static func writingClosure(_ value: Int?, to writer: Writer) throws {
        try writer.write(value)
    }
}
