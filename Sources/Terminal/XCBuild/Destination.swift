import Foundation
import SourceryAutoProtocols

public protocol DestinationProtocol: AutoMockable
{
    // sourcery:inline:Destination.AutoGenerateProtocol
    var raw: [String: String] { get set }
    var asString: String { get }
    // sourcery:end
}

/**
 See https://developer.apple.com/library/content/technotes/tn2339/_index.html

    also: http://www.mokacoding.com/blog/xcodebuild-destination-options/
    List all known devices:
    instruments -s devices
 */
public struct Destination: DestinationProtocol, AutoGenerateProtocol
{
    public var raw = [String: String]()
    public init(_ properties: [String: String])
    {
        raw = properties
    }

    public var asString: String
    {
        return raw.map { "\($0.key)=\($0.value)" }.joined(separator: ",")
    }
}

extension Destination
{
    public enum Architecture: String
    {
        case i386
        case x86_64
    }

    public enum OS
    {
        case iOS(version: String)
        case tvOS(version: String)
        case latest
        var name: String
        {
            switch self
            {
            case let .iOS(version):
                return version
            case let .tvOS(version):
                return version
            case .latest:
                return "latest"
            }
        }
    }
}

extension Destination
{
    public enum PlatformType: String
    {
        case macOS
        case iOS, tvOS, iOSSimulator, tvOSSimulator
    }

    public enum Simulator: String
    {
        case iOS = "iOS Simulator"
        case tvOS = "tvOS Simulator"

        public var name: String { return rawValue }
    }

    public enum Device: String
    {
        case iOS
        case tvOS
        var name: String { return rawValue }
    }
}

extension Destination
{
    public struct Platform
    {
        public init(type: PlatformType = .iOS, isGeneric: Bool = false)
        {
            self.type = type
            self.isGeneric = isGeneric
        }

        public var type: PlatformType
        public var isGeneric: Bool
    }
}
