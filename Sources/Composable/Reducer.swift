//
//  Reducer.swift
//  Composable
//
//  Created by Julien Delferiere on 08/12/2024.
//

import Observation

/// Reducer: aims to store feature state and send feature action
/// This is the only class needed due to the observation conformance
@Observable public final class Reducer<State: Equatable, Action: Equatable>: Equatable {
    // MARK: - Typealias
    public typealias Reduce = (State, Action) -> State
    // MARK: - Properties
    private let reduce: Reduce
    private(set) var state: State
    // MARK: - Init
    public init(state: State, reducer: @escaping Reduce) {
        self.state = state
        self.reduce = reducer
    }
    // MARK: - Deinit
    deinit {
        print("Reducer of: \(String(describing: self)) is deinit")
    }
    // MARK: - Initernal functions
    /// Aims to send an action
    /// - Parameter action: Action
    func send(_ action: Action) {
        self.state = reduce(state, action)
    }
    // MARK: - Equatable conformance
    public static func == (lhs: Reducer<State, Action>, rhs: Reducer<State, Action>) -> Bool {
        return lhs.state == rhs.state
    }
}
