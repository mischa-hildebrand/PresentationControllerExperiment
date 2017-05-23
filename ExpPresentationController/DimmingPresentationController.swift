//
//  DimmingPresentationController.swift
//  ExpPresentationController
//
//  Created by Mischa Hildebrand on 23.05.17.
//

import UIKit

class DimmingPresentationController: UIPresentationController {
    
    // MARK: - 🔶 Properties
    
    @IBOutlet var closeButton: UIButton!
    
    lazy var dimmingView = Bundle.main.loadNibNamed("DimmedPresentationView", owner: self, options: nil)?.first as! UIView
    
    
    // MARK: - 👆 Actions
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - UIPresentationController Overrides
    
    override func presentationTransitionWillBegin() {
        addAndSetupSubviews()
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.dimmingView.alpha = 1
        }, completion: nil)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            // If the presentation was aborted set the presentation controller back to its initial state.
            dimmingView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.dimmingView.alpha = 0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    
    // MARK: - ✋ Private helpers
    
    private func addAndSetupSubviews() {
        guard let presentedView = presentedView else {
            return
        }
    
        dimmingView.alpha = 0
        containerView?.insertSubview(dimmingView, belowSubview: presentedView)
        dimmingView.frame = presentingViewController.view.bounds
    }

}
