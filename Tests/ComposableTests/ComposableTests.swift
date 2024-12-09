import SwiftUI
import Testing
@testable import Composable

// MARK: - Mock Feature
struct CounterFeature: Feature {
    struct State: Equatable {
        var count: Int
    }
    enum Action: Equatable {
        case increment
        case decrement
    }
    
    var body: Reducer<State, Action> {
        Reducer(state: State(count: 0)) { state, action in
            switch action {
            case .increment:
                return State(count: state.count + 1)
            case .decrement:
                return State(count: state.count - 1)
            }
        }
    }
}

// MARK: - Tests
@Test func testReducerHandlesActions() async {
    // Arrange
    let feature = CounterFeature()
    let reducer = feature.body

    // Act
    reducer.send(.increment)
    reducer.send(.increment)
    reducer.send(.decrement)

    // Assert
    // Reducer should correctly handle actions
    #expect(reducer.state.count == 1)
}

@Test func testStoreSendsActions() async {
    // Arrange
    let feature = CounterFeature()
    let store = Store(feature: feature)

    // Act
    store.send(.increment)
    store.send(.increment)
    store.send(.decrement)

    // Assert
    // Store should send actions and update state
    #expect(store.state.count == 1)
}

@Test func testReducerDeinit() async {
    // Arrange
    var reducer: Reducer<CounterFeature.State, CounterFeature.Action>? = CounterFeature().body
    
    // Act
    weak var weakReducer = reducer
    reducer = nil
    
    // Assert
    // Reducer should be deinitialized when no longer referenced
    #expect(weakReducer == nil)
}
