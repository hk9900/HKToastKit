import SwiftUI

public enum ToastType {
    case success
    case error
    case warning
    case info
    case custom(icon: String, color: Color)
    
    public var icon: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .info: return "info.circle.fill"
        case .custom(let icon, _): return icon
        }
    }
    
    public var color: Color {
        switch self {
        case .success: return .green
        case .error: return .red
        case .warning: return .orange
        case .info: return .blue
        case .custom(_, let color): return color
        }
    }
}

