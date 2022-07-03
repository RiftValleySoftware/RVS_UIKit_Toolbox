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
// MARK: - Main Test Harness View Controller -
/* ###################################################################################################################################### */
/**
 This is a base class for view controllers in the tabbed section of the app.
 */
class RVS_UIKit_Toolbox_TestHarness_Base_Tabs_ViewController: UIViewController {
    /* ############################################################## */
    /**
     This can be overloaded or set, to provide the image to be used as a background gradient.
     */
    var backgroundGradientImage: UIImage? = UIImage(named: "background-gradient")
    
    /* ############################################################## */
    /**
     This can be overloaded or set, to provide the image to be used as a "watermark."
     */
    var watermarkImage: UIImage? = UIImage(named: "CenterImage")

    /* ################################################################## */
    /**
     This is the background image view.
     */
    var myBackgroundGradientView: UIImageView?

    /* ################################################################## */
    /**
     This is the background center image view.
     */
    var myCenterImageView: UIImageView?

    /* ################################################################## */
    /**
     Called when the view Hierarchy has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem?.title = tabBarItem?.title?.localizedVariant
        if let view = view {
            myBackgroundGradientView = UIImageView()
            if let backgroundGradientView = myBackgroundGradientView,
               let backGroundImage = backgroundGradientImage {
                backgroundGradientView.image = backGroundImage
                backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
                backgroundGradientView.contentMode = .scaleToFill
                view.insertSubview(backgroundGradientView, at: 0)
                
                backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
                backgroundGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                backgroundGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                backgroundGradientView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                backgroundGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                
                myCenterImageView = UIImageView()
                if let centerImageView = myCenterImageView,
                   let centerImage = watermarkImage {
                    centerImageView.image = centerImage
                    centerImageView.alpha = 0.05
                    centerImageView.tintColor = .white
                    centerImageView.translatesAutoresizingMaskIntoConstraints = false
                    centerImageView.contentMode = .scaleAspectFit
                    backgroundGradientView.insertSubview(centerImageView, at: 1)

                    centerImageView.centerXAnchor.constraint(equalTo: backgroundGradientView.centerXAnchor).isActive = true
                    centerImageView.centerYAnchor.constraint(equalTo: backgroundGradientView.centerYAnchor).isActive = true
                    
                    centerImageView.widthAnchor.constraint(lessThanOrEqualTo: backgroundGradientView.widthAnchor, multiplier: 0.6).isActive = true
                    centerImageView.heightAnchor.constraint(lessThanOrEqualTo: backgroundGradientView.heightAnchor, multiplier: 0.6).isActive = true

                    if let aspectConstraint = centerImageView.autoLayoutAspectConstraint(aspectRatio: 1.0) {
                        aspectConstraint.isActive = true
                        backgroundGradientView.addConstraint(aspectConstraint)
                    }
                }
            }
        }
    }
}
