//
//  Feature.swift
//  Composable
//
//  Created by Julien Delferiere on 08/12/2024.
//

/// Aims to define a composable feature
public protocol Feature {
    /// Feature State
    associatedtype State: Equatable
    /// Featue Action
    associatedtype Action: Equatable
    /// Feature body reducer, deduct state from an action
    var body: Reducer<State, Action> { get }
}
