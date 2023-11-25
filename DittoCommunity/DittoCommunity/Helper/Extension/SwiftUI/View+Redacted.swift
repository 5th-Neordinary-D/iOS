//
//  View+Redacted.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/26/23.
//

import SwiftUI

extension View {
    
    @ViewBuilder func redacted(_ state: Bool) -> some View {
        if state {
            self.redacted(reason: .placeholder)
        } else {
            self
        }
    }
}
