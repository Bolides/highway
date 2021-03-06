import Errors
import Foundation
import SecretsLibrary
import SignPost
import SourceryAutoProtocols
import Terminal
import ZFile

// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// MARK: - SecretProtocolMock

open class SecretProtocolMock: SecretProtocol
{
    public init() {}

    public var secretFileDates: [String: Date] = [:]
}

// MARK: - SecretsWorkerProtocolMock

open class SecretsWorkerProtocolMock: SecretsWorkerProtocol
{
    public init() {}

    public static var shared: SecretsWorker
    {
        get { return underlyingShared }
        set(value) { underlyingShared = value }
    }

    public static var underlyingShared: SecretsWorker!
    public static var gitSecretname: String
    {
        get { return underlyingGitSecretname }
        set(value) { underlyingGitSecretname = value }
    }

    public static var underlyingGitSecretname: String = "AutoMockable filled value"

    // MARK: - <revealSecrets> - parameters

    public var revealSecretsInThrowableError: Error?
    public var revealSecretsInCallsCount = 0
    public var revealSecretsInCalled: Bool
    {
        return revealSecretsInCallsCount > 0
    }

    public var revealSecretsInReceivedFolder: FolderProtocol?
    public var revealSecretsInReturnValue: [String]?

    // MARK: - <revealSecrets> - closure mocks

    public var revealSecretsInClosure: ((FolderProtocol) throws -> [String])?

    // MARK: - <revealSecrets> - method mocked

    open func revealSecrets(in folder: FolderProtocol) throws -> [String]
    {
        // <revealSecrets> - Throwable method implementation

        if let error = revealSecretsInThrowableError
        {
            throw error
        }

        revealSecretsInCallsCount += 1
        revealSecretsInReceivedFolder = folder

        // <revealSecrets> - Return Value mock implementation

        guard let closureReturn = revealSecretsInClosure else
        {
            guard let returnValue = revealSecretsInReturnValue else
            {
                let message = "No returnValue implemented for revealSecretsInClosure"
                let error = SourceryMockError.implementErrorCaseFor(message)

                // You should implement [String]

                throw error
            }
            return returnValue
        }

        return try closureReturn(folder)
    }

    // MARK: - <secretsChangedSinceLastPush> - parameters

    public var secretsChangedSinceLastPushInThrowableError: Error?
    public var secretsChangedSinceLastPushInCallsCount = 0
    public var secretsChangedSinceLastPushInCalled: Bool
    {
        return secretsChangedSinceLastPushInCallsCount > 0
    }

    public var secretsChangedSinceLastPushInReceivedFolder: FolderProtocol?
    public var secretsChangedSinceLastPushInReturnValue: [String]?

    // MARK: - <secretsChangedSinceLastPush> - closure mocks

    public var secretsChangedSinceLastPushInClosure: ((FolderProtocol) throws -> [String])?

    // MARK: - <secretsChangedSinceLastPush> - method mocked

    open func secretsChangedSinceLastPush(in folder: FolderProtocol) throws -> [String]
    {
        // <secretsChangedSinceLastPush> - Throwable method implementation

        if let error = secretsChangedSinceLastPushInThrowableError
        {
            throw error
        }

        secretsChangedSinceLastPushInCallsCount += 1
        secretsChangedSinceLastPushInReceivedFolder = folder

        // <secretsChangedSinceLastPush> - Return Value mock implementation

        guard let closureReturn = secretsChangedSinceLastPushInClosure else
        {
            guard let returnValue = secretsChangedSinceLastPushInReturnValue else
            {
                let message = "No returnValue implemented for secretsChangedSinceLastPushInClosure"
                let error = SourceryMockError.implementErrorCaseFor(message)

                // You should implement [String]

                throw error
            }
            return returnValue
        }

        return try closureReturn(folder)
    }

    // MARK: - <attemptHideSecrets> - parameters

    public var attemptHideSecretsInThrowableError: Error?
    public var attemptHideSecretsInCallsCount = 0
    public var attemptHideSecretsInCalled: Bool
    {
        return attemptHideSecretsInCallsCount > 0
    }

    public var attemptHideSecretsInReceivedFolder: FolderProtocol?
    public var attemptHideSecretsInReturnValue: [String]?

    // MARK: - <attemptHideSecrets> - closure mocks

    public var attemptHideSecretsInClosure: ((FolderProtocol) throws -> [String])?

    // MARK: - <attemptHideSecrets> - method mocked

    open func attemptHideSecrets(in folder: FolderProtocol) throws -> [String]
    {
        // <attemptHideSecrets> - Throwable method implementation

        if let error = attemptHideSecretsInThrowableError
        {
            throw error
        }

        attemptHideSecretsInCallsCount += 1
        attemptHideSecretsInReceivedFolder = folder

        // <attemptHideSecrets> - Return Value mock implementation

        guard let closureReturn = attemptHideSecretsInClosure else
        {
            guard let returnValue = attemptHideSecretsInReturnValue else
            {
                let message = "No returnValue implemented for attemptHideSecretsInClosure"
                let error = SourceryMockError.implementErrorCaseFor(message)

                // You should implement [String]

                throw error
            }
            return returnValue
        }

        return try closureReturn(folder)
    }

    // MARK: - <commitHiddenSecrets> - parameters

    public var commitHiddenSecretsInThrowableError: Error?
    public var commitHiddenSecretsInCallsCount = 0
    public var commitHiddenSecretsInCalled: Bool
    {
        return commitHiddenSecretsInCallsCount > 0
    }

    public var commitHiddenSecretsInReceivedFolder: FolderProtocol?
    public var commitHiddenSecretsInReturnValue: [String]?

    // MARK: - <commitHiddenSecrets> - closure mocks

    public var commitHiddenSecretsInClosure: ((FolderProtocol) throws -> [String])?

    // MARK: - <commitHiddenSecrets> - method mocked

    open func commitHiddenSecrets(in folder: FolderProtocol) throws -> [String]
    {
        // <commitHiddenSecrets> - Throwable method implementation

        if let error = commitHiddenSecretsInThrowableError
        {
            throw error
        }

        commitHiddenSecretsInCallsCount += 1
        commitHiddenSecretsInReceivedFolder = folder

        // <commitHiddenSecrets> - Return Value mock implementation

        guard let closureReturn = commitHiddenSecretsInClosure else
        {
            guard let returnValue = commitHiddenSecretsInReturnValue else
            {
                let message = "No returnValue implemented for commitHiddenSecretsInClosure"
                let error = SourceryMockError.implementErrorCaseFor(message)

                // You should implement [String]

                throw error
            }
            return returnValue
        }

        return try closureReturn(folder)
    }

    // MARK: - <attemptHideSecretsWithgpg> - parameters

    public var attemptHideSecretsWithgpgInThrowableError: Error?
    public var attemptHideSecretsWithgpgInCallsCount = 0
    public var attemptHideSecretsWithgpgInCalled: Bool
    {
        return attemptHideSecretsWithgpgInCallsCount > 0
    }

    public var attemptHideSecretsWithgpgInReceivedFolder: FolderProtocol?
    public var attemptHideSecretsWithgpgInReturnValue: [String]?

    // MARK: - <attemptHideSecretsWithgpg> - closure mocks

    public var attemptHideSecretsWithgpgInClosure: ((FolderProtocol) throws -> [String])?

    // MARK: - <attemptHideSecretsWithgpg> - method mocked

    open func attemptHideSecretsWithgpg(in folder: FolderProtocol) throws -> [String]
    {
        // <attemptHideSecretsWithgpg> - Throwable method implementation

        if let error = attemptHideSecretsWithgpgInThrowableError
        {
            throw error
        }

        attemptHideSecretsWithgpgInCallsCount += 1
        attemptHideSecretsWithgpgInReceivedFolder = folder

        // <attemptHideSecretsWithgpg> - Return Value mock implementation

        guard let closureReturn = attemptHideSecretsWithgpgInClosure else
        {
            guard let returnValue = attemptHideSecretsWithgpgInReturnValue else
            {
                let message = "No returnValue implemented for attemptHideSecretsWithgpgInClosure"
                let error = SourceryMockError.implementErrorCaseFor(message)

                // You should implement [String]

                throw error
            }
            return returnValue
        }

        return try closureReturn(folder)
    }

    // MARK: - <gitSecretProcess> - parameters

    public var gitSecretProcessInThrowableError: Error?
    public var gitSecretProcessInCallsCount = 0
    public var gitSecretProcessInCalled: Bool
    {
        return gitSecretProcessInCallsCount > 0
    }

    public var gitSecretProcessInReceivedFolder: FolderProtocol?
    public var gitSecretProcessInReturnValue: ProcessProtocol?

    // MARK: - <gitSecretProcess> - closure mocks

    public var gitSecretProcessInClosure: ((FolderProtocol) throws -> ProcessProtocol)?

    // MARK: - <gitSecretProcess> - method mocked

    open func gitSecretProcess(in folder: FolderProtocol) throws -> ProcessProtocol
    {
        // <gitSecretProcess> - Throwable method implementation

        if let error = gitSecretProcessInThrowableError
        {
            throw error
        }

        gitSecretProcessInCallsCount += 1
        gitSecretProcessInReceivedFolder = folder

        // <gitSecretProcess> - Return Value mock implementation

        guard let closureReturn = gitSecretProcessInClosure else
        {
            guard let returnValue = gitSecretProcessInReturnValue else
            {
                let message = "No returnValue implemented for gitSecretProcessInClosure"
                let error = SourceryMockError.implementErrorCaseFor(message)

                // You should implement ProcessProtocol

                throw error
            }
            return returnValue
        }

        return try closureReturn(folder)
    }
}

// MARK: - OBJECTIVE-C

// MARK: - Sourcery Errors

public enum SourceryMockError: Swift.Error, Hashable
{
    case implementErrorCaseFor(String)
    case subclassMockBeforeUsing(String)

    public var debugDescription: String
    {
        switch self
        {
        case let .implementErrorCaseFor(message):
            return """
            🧙‍♂️ SourceryMockError.implementErrorCaseFor:
            message: \(message)
            """
        case let .subclassMockBeforeUsing(message):
            return """
            \n
            🧙‍♂️ SourceryMockError.subclassMockBeforeUsing:
            message: \(message)
            """
        }
    }
}
