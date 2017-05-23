//
//  PresentedViewController.swift
//  ExpPresentationController
//
//  Created by Mischa Hildebrand on 23.05.17.
//

import UIKit

class PresentedViewController: UIViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }

    @IBAction func viewTapped(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}


extension PresentedViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}
