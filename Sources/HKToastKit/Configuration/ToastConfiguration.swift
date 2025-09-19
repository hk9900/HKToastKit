import SwiftUI

public struct ToastConfiguration {
    public let primaryColor: Color
    public let backgroundColor: AnyShapeStyle
    public let textColor: Color
    public let cornerRadius: CGFloat
    public let shadowRadius: CGFloat
    public let shadowOpacity: Double
    public let animationDuration: Double
    public let defaultDuration: TimeInterval
    public let maxToasts: Int
    public let position: ToastPosition
    public let spacing: CGFloat
    public let horizontalPadding: CGFloat
    public let verticalPadding: CGFloat
    
    public init(
        primaryColor: Color = .primary,
        backgroundColor: AnyShapeStyle = AnyShapeStyle(.regularMaterial),
        textColor: Color = .primary,
        cornerRadius: CGFloat = 8,
        shadowRadius: CGFloat = 4,
        shadowOpacity: Double = 0.1,
        animationDuration: Double = 0.3,
        defaultDuration: TimeInterval = 3.0,
        maxToasts: Int = 5,
        position: ToastPosition = .top,
        spacing: CGFloat = 8,
        horizontalPadding: CGFloat = 16,
        verticalPadding: CGFloat = 16
    ) {
        self.primaryColor = primaryColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.animationDuration = animationDuration
        self.defaultDuration = defaultDuration
        self.maxToasts = maxToasts
        self.position = position
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
}

public enum ToastPosition {
    case top
    case bottom
    case center
}
