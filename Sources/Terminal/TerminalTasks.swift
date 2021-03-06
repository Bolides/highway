//
//  Commands.swift
//
//  Created by Stijn on 29/05/2018.
//

import Foundation
import SignPost
import SourceryAutoProtocols

public enum TerminalTask: RawRepresentable, Equatable, AutoCases
{
    case git(ArgumentExecutableProtocol)
    case cat(ArgumentExecutableProtocol)
    case sourcery(ArgumentExecutableProtocol)
    case pod(ArgumentExecutableProtocol)

    case xcodebuild(ArgumentExecutableProtocol)
    case xcodebuildTests(ArgumentExecutableProtocol)
    case cd(ArgumentExecutableProtocol)

    // MARK: - Executable

    public var executable: ArgumentExecutableProtocol
    {
        switch self
        {
        case let .xcodebuild(exec):
            return exec
        case let .git(exec):
            return exec
        case let .sourcery(exec):
            return exec
        case let .cat(exec):
            return exec
        case let .xcodebuildTests(testOptions):
            return testOptions
        case let .cd(path):
            return path
        case let .pod(pod):
            return pod
        }
    }

    // MARK: - Equatable

    public static func == (lhs: TerminalTask, rhs: TerminalTask) -> Bool
    {
        switch (lhs, rhs)
        {
        case (.xcodebuild, .xcodebuild):
            return true
        case (.git, .git):
            return true
        case (.sourcery, .sourcery):
            return true
        case (.cd, .cd):
            return true
        case (.xcodebuildTests, .xcodebuildTests):
            return true
        case (.pod, .pod):
            return true
        default:
            return false
        }
    }

    // MARK: - RawRepresentable

    public typealias RawValue = String

    public var rawValue: String
    {
        switch self
        {
        case .xcodebuild:
            return "xcodebuild"
        case .sourcery:
            return "sourcery"
        case .cat:
            return "cat"
        case .git:
            return "git"
        case .xcodebuildTests:
            return "xcodebuild"
        case .cd:
            return "cd"
        case .pod:
            return "pod"
        }
    }

    public init?(rawValue: String)
    {
        switch rawValue
        {
        default:
            SignPost.shared.error("not possible \(rawValue)")
            return nil
        }
    }
}
