//
//  ViewStore.swift
//  Composable
//
//  Created by Julien Delferiere on 08/12/2024.
//

import SwiftUI

/// ViewStore: aims to handle state in SwiftUI View
public struct ViewStore<Content: View, AttachFeature: Feature>: View {
    // MARK: - Properties
    private let store: Store<AttachFeature>
    private let content: (AttachFeature.State) -> Content
    // MARK: - Init
    public init(_ store: Store<AttachFeature>,
         content: @escaping (AttachFeature.State) -> Content) {
        self.store = store
        self.content = content
    }
    // MARK: - View body's
    public var body: some View {
        self.content(store.state)
    }
}
