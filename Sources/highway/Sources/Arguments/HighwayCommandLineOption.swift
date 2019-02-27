import Foundation

public enum HighwayCommandLineOption: String, CaseIterable {
    case srcRoot
    case _srcRoot = "-srcRoot"
    case __srcRoot = "--srcRoot"
    case srcroot = "srcroot"
    
    public var isSrcRoot: Bool {
        
        switch self {
        case .__srcRoot,._srcRoot,.srcRoot, .srcroot:
            return true
        }
        
    }
    
    public var singleOption: HighwayCommandLineOption.SingleOption {
        switch self {
        case .__srcRoot,._srcRoot,.srcRoot, .srcroot:
            return SingleOption.srcroot
        }
    }
    
    public static var validOptionsFormCommandLine: Set<HighwayCommandLineOption> {
        return Set(CommandLine.arguments.compactMap { HighwayCommandLineOption(rawValue: $0) })
    }
    
    // MARK: - Enum
    public enum SingleOption: String, CaseIterable {
        case srcroot
    }
    
    // MARK: - Structs
    
    public struct Values {
        
        public let optionsAndValues: [HighwayCommandLineOption.SingleOption : String]
        
        public init(options: Set<HighwayCommandLineOption> = HighwayCommandLineOption.validOptionsFormCommandLine, arguments: [String] = CommandLine.arguments) {
            
            var optionsAndValues = [HighwayCommandLineOption.SingleOption : String]()
            
            options.forEach { option in
               
                guard let optionIndex = arguments.firstIndex(of: option.rawValue) else {
                    return
                }
                let nextIndex = optionIndex + 1
                let value = arguments[nextIndex]
                
                optionsAndValues[option.singleOption] = value
            }
            
            self.optionsAndValues = optionsAndValues
        }
        
    }
    
}
