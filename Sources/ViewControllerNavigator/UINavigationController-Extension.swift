import UIKit

extension UINavigationController {
    
    var isRootViewControllerShown: Bool {
        return viewControllers.first == visibleViewController
    }
    
}
