//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import Runtime

public struct MockStreamInput: Reflection, Encodable {
    let body: ByteStream
    
    public init(body: ByteStream) {
        self.body = body
    }
}
