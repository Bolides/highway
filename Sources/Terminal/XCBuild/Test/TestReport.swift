import Errors
import Foundation
import SignPost
import SourceryAutoProtocols

public protocol TestReportProtocol: AutoMockable
{
    // sourcery:inline:TestReport.AutoGenerateProtocol
    var testSuiteOutput: [String] { get }
    var output: [String] { get }
    var totalNumberOfTests: Int { get }
    var description: String { get }

    // sourcery:end
}

public struct TestReport: TestReportProtocol, AutoGenerateProtocol, Encodable, CustomStringConvertible
{
    public let testSuiteOutput: [String]
    public let output: [String]
    public let totalNumberOfTests: Int

    public init(output: [String]) throws
    {
        self.output = output

        let allTestSuites = output.filter
        {
            $0.hasPrefix("Test Suite") || $0.contains("Executed")
        }

        guard allTestSuites.count > 0 else
        {
            throw Error.error(pretty_function(), error: .invalidTestOutput(output))
        }
        let testSuiteOutput = allTestSuites
        let results = allTestSuites.filter { $0.contains("Executed") }

        var total = 0

        try results.forEach
        { result in
            let all = result.components(separatedBy: " ")
            let numbers = all.compactMap { Int($0) }

            guard numbers.count >= 2 else
            {
                throw Error.error(pretty_function(), error: .invalidTestOutput(output))
            }

            total = total + numbers[0]

            guard numbers[1] == 0 else
            {
                throw Error.error(pretty_function(), error: Error.testsFailed(summary: testSuiteOutput))
            }
        }
        self.testSuiteOutput = testSuiteOutput
        totalNumberOfTests = total
    }

    // MARK: - Description

    public var description: String
    {
        return """
        Test Suite report of \(totalNumberOfTests) tests
        
        \(testSuiteOutput.joined(separator: "\n"))
        """
    }

    // MARK: - Errors

    public indirect enum Error: Swift.Error, CustomStringConvertible
    {
        public var description: String
        {
            let header = "TestReport error"
            switch self
            {
            case let .invalidTestOutput(output):
                return """
                \(header)
                Invalid test output
                \(output.joined(separator: "\n"))
                """
            case let .error(location, error):
                return """
                \(header)
                Indirect error at location: \(location)
                \(error)
                """
            case let .testsFailed(summary):
                return """
                \(header)
                Test Failed with summary:
                
                \(summary.joined(separator: "\n"))
                
                """
            }
        }

        case invalidTestOutput([String])
        case error(_ atLocation: String, error: Error)
        case testsFailed(summary: [String])

        public var indirectError: Error?
        {
            switch self
            {
            case let .error(_, error: error):
                return error
            default:
                return nil
            }
        }

        public var testFailedSummary: [String]?
        {
            switch self
            {
            case let .testsFailed(summary: summary):
                return summary
            default:
                return nil
            }
        }
    }
}
