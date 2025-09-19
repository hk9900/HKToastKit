import SwiftUI
import Combine

@MainActor
public class ToastManager: ObservableObject {
    @Published public var toasts: [Toast] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    public init() {
        setupToastLimit()
    }
    
    public func show(
        _ message: String, 
        type: ToastType = .info, 
        duration: TimeInterval? = nil
    ) {
        let toastDuration = duration ?? HKToastKit.configuration?.defaultDuration ?? 3.0
        let toast = Toast(message: message, type: type, duration: toastDuration)
        
        // Add to toasts array
        toasts.append(toast)
        
        // Auto-dismiss after duration
        DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration) {
            self.dismiss(toast)
        }
    }
    
    public func dismiss(_ toast: Toast) {
        withAnimation(.easeInOut(duration: HKToastKit.configuration?.animationDuration ?? 0.3)) {
            toasts.removeAll { $0.id == toast.id }
        }
    }
    
    public func dismissAll() {
        withAnimation(.easeInOut(duration: HKToastKit.configuration?.animationDuration ?? 0.3)) {
            toasts.removeAll()
        }
    }
    
    public func dismissByType(_ type: ToastType) {
        withAnimation(.easeInOut(duration: HKToastKit.configuration?.animationDuration ?? 0.3)) {
            toasts.removeAll { $0.type.icon == type.icon }
        }
    }
    
    private func setupToastLimit() {
        $toasts
            .sink { [weak self] toasts in
                guard let self = self else { return }
                let maxToasts = HKToastKit.configuration?.maxToasts ?? 5
                if toasts.count > maxToasts {
                    let excessCount = toasts.count - maxToasts
                    self.toasts.removeFirst(excessCount)
                }
            }
            .store(in: &cancellables)
    }
}

