# HKToastKit

A flexible and customizable toast notification system for SwiftUI applications.

## Features

- 🎨 **Customizable Appearance**: Configure colors, fonts, corner radius, shadows, and more
- 📱 **Multiple Positions**: Display toasts at top, center, or bottom of the screen
- ⏱️ **Flexible Duration**: Set custom display duration or use default timing
- 🔄 **Animation Support**: Smooth show/hide animations with configurable duration
- 📊 **Queue Management**: Automatic queue management with configurable maximum toast limit
- 🎯 **Type Safety**: Strongly typed toast types (success, error, warning, info)
- 🛠️ **Easy Integration**: Simple setup with minimal code required

## Requirements

- iOS 16.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

### Swift Package Manager

Add HKToastKit to your project using Swift Package Manager:

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/hk9900/HKToastKit`
3. Select the version you want to use
4. Click **Add Package**

## Quick Start

### 1. Configure HKToastKit

Configure the toast system in your app's entry point:

```swift
import SwiftUI
import HKToastKit

@main
struct MyApp: App {
    init() {
        // Configure HKToastKit
        let config = ToastConfiguration(
            primaryColor: .blue,
            backgroundColor: AnyShapeStyle(.regularMaterial),
            textColor: .primary,
            cornerRadius: 12,
            shadowRadius: 8,
            shadowOpacity: 0.15,
            animationDuration: 0.3,
            defaultDuration: 3.0,
            maxToasts: 5,
            position: .top,
            spacing: 12,
            horizontalPadding: 16,
            verticalPadding: 12
        )
        
        HKToastKit.configure(with: config)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 2. Add Toast Manager to Your ViewModels

```swift
import SwiftUI
import HKToastKit

@MainActor
class MyViewModel: ObservableObject {
    let toastManager = ToastManager()
    
    func showSuccess() {
        toastManager.show("Operation completed successfully!", type: .success)
    }
    
    func showError() {
        toastManager.show("Something went wrong!", type: .error)
    }
}
```

### 3. Add Toast Overlay to Your Views

```swift
import SwiftUI
import HKToastKit

struct ContentView: View {
    @StateObject private var viewModel = MyViewModel()
    
    var body: some View {
        VStack {
            // Your content here
            Button("Show Toast") {
                viewModel.showSuccess()
            }
        }
        .toastOverlay(toastManager: viewModel.toastManager)
    }
}
```

## Configuration Options

### ToastConfiguration

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `primaryColor` | `Color` | `.primary` | Primary color for toast elements |
| `backgroundColor` | `AnyShapeStyle` | `.regularMaterial` | Background style for toasts |
| `textColor` | `Color` | `.primary` | Text color for toast messages |
| `cornerRadius` | `CGFloat` | `8` | Corner radius for toast containers |
| `shadowRadius` | `CGFloat` | `4` | Shadow radius for toast containers |
| `shadowOpacity` | `Double` | `0.1` | Shadow opacity for toast containers |
| `animationDuration` | `Double` | `0.3` | Duration for show/hide animations |
| `defaultDuration` | `TimeInterval` | `3.0` | Default display duration |
| `maxToasts` | `Int` | `5` | Maximum number of toasts to display |
| `position` | `ToastPosition` | `.top` | Position on screen |
| `spacing` | `CGFloat` | `8` | Spacing between multiple toasts |
| `horizontalPadding` | `CGFloat` | `16` | Horizontal padding for toast content |
| `verticalPadding` | `CGFloat` | `12` | Vertical padding for toast content |

### ToastPosition

- `.top` - Display toasts at the top of the screen
- `.center` - Display toasts in the center of the screen
- `.bottom` - Display toasts at the bottom of the screen

### ToastType

- `.success` - Green toast with checkmark icon
- `.error` - Red toast with X icon
- `.warning` - Orange toast with warning icon
- `.info` - Blue toast with info icon

## Advanced Usage

### Custom Toast Duration

```swift
// Show a toast for 5 seconds
toastManager.show("Custom duration", type: .info, duration: 5.0)
```

### Multiple Toasts

The system automatically manages multiple toasts with proper spacing and queue management:

```swift
toastManager.show("First toast", type: .success)
toastManager.show("Second toast", type: .warning)
toastManager.show("Third toast", type: .error)
```

### Programmatic Dismissal

```swift
// Dismiss all toasts
toastManager.dismissAll()

// Dismiss specific toast (if you have a reference)
toastManager.dismiss(toast)
```

## Customization Examples

### Dark Mode Support

```swift
let config = ToastConfiguration(
    primaryColor: .white,
    backgroundColor: AnyShapeStyle(.thickMaterial),
    textColor: .white,
    cornerRadius: 16,
    shadowRadius: 12,
    shadowOpacity: 0.3
)
```

### Minimal Design

```swift
let config = ToastConfiguration(
    primaryColor: .black,
    backgroundColor: AnyShapeStyle(.ultraThinMaterial),
    textColor: .black,
    cornerRadius: 4,
    shadowRadius: 0,
    shadowOpacity: 0
)
```

### Prominent Design

```swift
let config = ToastConfiguration(
    primaryColor: .white,
    backgroundColor: AnyShapeStyle(.red),
    textColor: .white,
    cornerRadius: 20,
    shadowRadius: 16,
    shadowOpacity: 0.4
)
```

## Architecture

HKToastKit follows a clean architecture pattern:

- **Models**: `Toast`, `ToastType`, `ToastConfiguration`
- **Managers**: `ToastManager` for toast lifecycle management
- **Views**: `ToastView`, `ToastOverlayModifier` for UI components
- **Configuration**: `ConfigurationManager` for global settings

## Thread Safety

All public APIs are marked with `@MainActor` to ensure thread safety. Toast operations should be performed on the main thread.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

If you encounter any issues or have questions, please open an issue on GitHub.

---

Made with ❤️ for the SwiftUI community
