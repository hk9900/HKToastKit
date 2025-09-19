import SwiftUI

public struct Toast: Identifiable, Equatable {
    public let id = UUID()
    public let message: String
    public let type: ToastType
    public let duration: TimeInterval
    public let timestamp: Date
    
    public init(
        message: String, 
        type: ToastType, 
        duration: TimeInterval = 3.0
    ) {
        self.message = message
        self.type = type
        self.duration = duration
        self.timestamp = Date()
    }
    
    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        lhs.id == rhs.id
    }
}

