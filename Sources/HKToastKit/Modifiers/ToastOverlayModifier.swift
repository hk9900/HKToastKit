import SwiftUI

public struct ToastOverlayModifier: ViewModifier {
    @ObservedObject var toastManager: ToastManager
    
    public init(toastManager: ToastManager) {
        self.toastManager = toastManager
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            VStack {
                if HKToastKit.configuration?.position == .top {
                    VStack(spacing: HKToastKit.configuration?.spacing ?? 8) {
                        ForEach(toastManager.toasts) { toast in
                            ToastView(toast: toast) {
                                toastManager.dismiss(toast)
                            }
                        }
                        Spacer()
                    }
                } else if HKToastKit.configuration?.position == .bottom {
                    VStack {
                        Spacer()
                        VStack(spacing: HKToastKit.configuration?.spacing ?? 8) {
                            ForEach(toastManager.toasts) { toast in
                                ToastView(toast: toast) {
                                    toastManager.dismiss(toast)
                                }
                            }
                        }
                    }
                } else {
                    // Center position
                    VStack {
                        Spacer()
                        VStack(spacing: HKToastKit.configuration?.spacing ?? 8) {
                            ForEach(toastManager.toasts) { toast in
                                ToastView(toast: toast) {
                                    toastManager.dismiss(toast)
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

public extension View {
    func toastOverlay(toastManager: ToastManager) -> some View {
        modifier(ToastOverlayModifier(toastManager: toastManager))
    }
}

