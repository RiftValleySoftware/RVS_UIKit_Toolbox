/*
© Copyright 2022, The Great Rift Valley Software Company

LICENSE:

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

The Great Rift Valley Software Company: https://riftvalleysoftware.com
*/

import UIKit
import RVS_Generic_Swift_Toolbox

/* ###################################################################################################################################### */
// MARK: - UIView Extension Test Harness View Controller -
/* ###################################################################################################################################### */
/**
 This controls the UIView Test tab.
 */
class RVS_UIKit_Toolbox_TestHarness_Tab2_ViewController: RVS_UIKit_Toolbox_TestHarness_Base_Tabs_ViewController {
    /* ################################################################## */
    /**
     This will contain the anchor that defines the top of contained views. It changes, as each view is added.
     */
    weak var topAnchor: NSLayoutYAxisAnchor?
    
    /* ################################################################## */
    /**
     This will be a small, square view, at the top of the screen, that will be affected by the controls below it.
     */
    @IBOutlet weak var demoView: UIView?
    
    /* ################################################################## */
    /**
     This is the label for the corner radius slider.
     */
    @IBOutlet weak var cornerSizeSliderLabel: UILabel?
    
    /* ################################################################## */
    /**
     This changes the size of the rounded corners of the demo view.
     */
    @IBOutlet weak var cornerSizeSlider: UISlider?

    /* ################################################################## */
    /**
     This is the label for the border width slider.
     */
    @IBOutlet weak var borderWidthSliderLabel: UILabel?

    /* ################################################################## */
    /**
     This changes the width of the border around the demo view.
     */
    @IBOutlet weak var borderWidthSlider: UISlider?
    
    /* ################################################################## */
    /**
     This is the label for the border color switch.
     */
    @IBOutlet weak var borderColorSwitchLabel: UILabel?
    
    /* ################################################################## */
    /**
     This defines the color for the border, and is also used to fill the added views.
     */
    @IBOutlet weak var borderColorSegmentedSwitch: UISegmentedControl?
    
    /* ################################################################## */
    /**
     This is a container for new auto-layout contained views.
     */
    @IBOutlet weak var containedViewContainerView: UIView?
    
    /* ################################################################## */
    /**
     This button will add a new view to the auto-layout container.
     */
    @IBOutlet weak var addContainedViewButton: UIButton?
}

/* ###################################################################################################################################### */
// MARK: Base Class Overrides
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab2_ViewController {
    /* ################################################################## */
    /**
     Called when the view Hierarchy has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerSizeSliderLabel?.text = cornerSizeSliderLabel?.text?.localizedVariant
        borderWidthSliderLabel?.text = borderWidthSliderLabel?.text?.localizedVariant
        borderColorSwitchLabel?.text = borderColorSwitchLabel?.text?.localizedVariant
        addContainedViewButton?.setTitle(addContainedViewButton?.title(for: .normal)?.localizedVariant, for: .normal)
        for index in 0..<(borderColorSegmentedSwitch?.numberOfSegments ?? 0) {
            if 0 == index,
               let image = UIImage(systemName: "square")?.withTintColor(.black) {
                borderColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            } else if let color = UIColor(named: "Tint-\(index)"),
               let image = UIImage(systemName: "square.fill")?.withTintColor(color) {
                borderColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            }
        }
    }
    
    /* ################################################################## */
    /**
     Called just before the view appears. We use this to set everything up to defaults.
     
     - parameter isAnimated: Ignored, but sent to the superclass (appearance is animated).
     */
    override func viewWillAppear(_ isAnimated: Bool) {
        super.viewWillAppear(isAnimated)
        containedViewContainerView?.subviews.forEach { $0.removeFromSuperview() }
        topAnchor = containedViewContainerView?.topAnchor
        addContainedViewButton?.isEnabled = true
        borderColorSegmentedSwitch?.selectedSegmentIndex = 1
        cornerSizeSlider?.value = ((cornerSizeSlider?.maximumValue ?? 0) - (cornerSizeSlider?.minimumValue ?? 0)) / 2
        borderWidthSlider?.value = ((borderWidthSlider?.maximumValue ?? 0) - (borderWidthSlider?.minimumValue ?? 0)) / 4
        cornerSizeSliderChanged()
        borderWidthSliderChanged()
        borderColorSegmentedSwitchChanged()
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab2_ViewController {
    /* ################################################################## */
    /**
     The corner size slider has changed.
     
     - parameter: Ignored (and can be omitted).
     */
    @IBAction func cornerSizeSliderChanged(_: UISlider! = nil) {
        if let radius = cornerSizeSlider?.value {
            demoView?.cornerRadius = CGFloat(radius)
        }
    }
    
    /* ################################################################## */
    /**
     The border width slider has changed.
     
     - parameter: Ignored (and can be omitted).
    */
    @IBAction func borderWidthSliderChanged(_: UISlider! = nil) {
        if let width = borderWidthSlider?.value {
            demoView?.borderWidth = CGFloat(width)
        }
    }
    
    /* ################################################################## */
    /**
     The border color segmented switch has changed.
     
     - parameter: Ignored (and can be omitted).
     */
    @IBAction func borderColorSegmentedSwitchChanged(_: UISegmentedControl! = nil) {
        if let index = borderColorSegmentedSwitch?.selectedSegmentIndex {
            if 0 == index {
                demoView?.borderColor = .clear
            } else {
                demoView?.borderColor = UIColor(named: "Tint-\(index)")
            }
        }
    }
    
    /* ################################################################## */
    /**
     The add subview button was hit.
     
     - parameter: Ignored (and can be omitted).
     */
    @IBAction func addContainedViewButtonHit(_: Any! = nil) {
        let newView = UIView()
        newView.backgroundColor = demoView?.borderColor
        newView.cornerRadius = 12
        let newBottom = containedViewContainerView?.addContainedView(newView, underThis: topAnchor, andGiveMeABottomHook: true)
        newView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        topAnchor = newBottom
        
        addContainedViewButton?.isEnabled = 3 > (containedViewContainerView?.subviews.count ?? 3)
    }
}
