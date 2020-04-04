import Foundation

class Handler {}

// MARK: - Enums
enum NotificationFeedbackStyle: Int {
  case success
  case warning
  case error
}
enum ImpactStyle: Int {
  case light
  case medium
  case heavy
}
extension Handler {
    static let hapticHandler: HapticFeedbackProtocol?
}
protocol OverlayProtocol {
    func dismissOverlay()
    func displayOverlay()
}
protocol HUDProtocol {
    func dismissHUD()
    func displayHUD()
}
protocol HapticFeedbackProtocol {
   func hitImpact(_ type: ImpactStyle?)
   func hitImpact()
   func hitSelection()
   func hitNotification(_ type: NotificationFeedbackStyle)
}
