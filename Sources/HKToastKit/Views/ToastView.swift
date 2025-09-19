import SwiftUI

public struct ToastView: View {
    let toast: Toast
    let onDismiss: () -> Void
    
    public init(toast: Toast, onDismiss: @escaping () -> Void) {
        self.toast = toast
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            // Icon
            Image(systemName: toast.type.icon)
                .foregroundColor(toast.type.color)
                .font(.system(size: 16, weight: .medium))
            
            // Message
            Text(toast.message)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(HKToastKit.configuration?.textColor ?? .primary)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            
            Spacer()
            
            // Dismiss button
            Button(action: onDismiss) {
                Image(systemName: "xmark")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal, HKToastKit.configuration?.horizontalPadding ?? 16)
        .padding(.vertical, HKToastKit.configuration?.verticalPadding ?? 12)
        .background(
            RoundedRectangle(cornerRadius: HKToastKit.configuration?.cornerRadius ?? 8)
                .fill(HKToastKit.configuration?.backgroundColor ?? AnyShapeStyle(.regularMaterial))
                .shadow(
                    color: .black.opacity(HKToastKit.configuration?.shadowOpacity ?? 0.1),
                    radius: HKToastKit.configuration?.shadowRadius ?? 4,
                    x: 0,
                    y: 2
                )
        )
        .padding(.horizontal, HKToastKit.configuration?.horizontalPadding ?? 16)
        .transition(.asymmetric(
            insertion: .move(edge: getInsertionEdge()).combined(with: .opacity),
            removal: .move(edge: getInsertionEdge()).combined(with: .opacity)
        ))
    }
    
    private func getInsertionEdge() -> Edge {
        switch HKToastKit.configuration?.position ?? .top {
        case .top: return .top
        case .bottom: return .bottom
        case .center: return .top
        }
    }
}

