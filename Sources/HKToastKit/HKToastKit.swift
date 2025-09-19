import SwiftUI

@available(iOS 16.0, *)
public struct HKToastKit {
    @MainActor
    public static func configure(with configuration: ToastConfiguration) {
        ConfigurationManager.shared.setConfiguration(configuration)
    }
    
    @MainActor
    public static var configuration: ToastConfiguration? {
        ConfigurationManager.shared.configuration
    }
    
}

// MARK: - Configuration Manager
@MainActor
public final class ConfigurationManager: ObservableObject {
    public static let shared = ConfigurationManager()
    
    @Published public private(set) var configuration: ToastConfiguration?
    
    private init() {}
    
    public func setConfiguration(_ configuration: ToastConfiguration) {
        self.configuration = configuration
    }
}

