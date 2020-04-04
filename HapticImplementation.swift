import UIKit

private class ImpactFeedback : UIImpactFeedbackGenerator {}
private class NotificationFeedback : UINotificationFeedbackGenerator {}
private class SelectionFeedback : UISelectionFeedbackGenerator {}

final class HapticFeedbackImplementation: HapticFeedbackProtocol {
    
    //MARK: Private stored properties
    private var impactFeedback: ImpactFeedback
    private var impactMediumStyle: ImpactFeedback
    private var impactLightStyle: ImpactFeedback
    private var impactHeavyStyle: ImpactFeedback
    private var notificationFeedback: NotificationFeedback
    private var selectionFeedback: SelectionFeedback
    
    //MARK: Internal methods
    init() {
        self.impactFeedback       =   ImpactFeedback()
        self.impactMediumStyle    =   ImpactFeedback(style:.medium)
        self.impactLightStyle     =   ImpactFeedback(style:.light)
        self.impactHeavyStyle     =   ImpactFeedback(style:.heavy)
        self.notificationFeedback =   NotificationFeedback()
        self.selectionFeedback    =   SelectionFeedback()
    }
    
    func hitImpact(_ type:ImpactStyle?) {
        if let style = type {
            if style == ImpactStyle.medium {
                impactMediumStyle.impactOccurred()
            }
            if style == ImpactStyle.light {
                impactLightStyle.impactOccurred()
            }
            if style == ImpactStyle.heavy {
                impactHeavyStyle.impactOccurred()
            }
        }
    }
    
    func hitImpact() {
        impactFeedback.impactOccurred()
    }
    
    func hitSelection() {
        selectionFeedback.selectionChanged()
    }
    
    func hitNotification(_ type: NotificationFeedbackStyle) {
        if let notificationType = UINotificationFeedbackGenerator.FeedbackType(rawValue: type.rawValue) {
            notificationFeedback.notificationOccurred(notificationType)
        }
    }
}
