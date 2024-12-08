//
//  Store.swift
//  Composable
//
//  Created by Julien Delferiere on 08/12/2024.
//

import SwiftUI

/// Store: Boilerplate to observe reducer and give access to feature state and sendable actions
public struct Store<AttachFeature: Feature> {
    // MARK: - Properties
    @State private var reducer: Reducer<AttachFeature.State, AttachFeature.Action>
    /// Aims to expose feature state
    var state: AttachFeature.State {
        return reducer.state
    }
    // MARK: - Init
    public init(feature: AttachFeature) {
        self.reducer = feature.body
    }
    // MARK: - Public functions
    /// Boilerplate to send action from store
    /// - Parameter action: AttachFeature.Action
    public func send(_ action: AttachFeature.Action) {
        self.reducer.send(action)
    }
}
