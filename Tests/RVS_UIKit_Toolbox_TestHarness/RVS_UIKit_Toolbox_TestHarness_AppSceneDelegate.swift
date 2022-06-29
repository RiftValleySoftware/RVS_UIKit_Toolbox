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

/* ###################################################################################################################################### */
// MARK: - Combined Application and Scene Delegate Class -
/* ###################################################################################################################################### */
/**
 This combines the app delegate and the scene delegate into one file.
 */
@UIApplicationMain
class RVS_UIKit_Toolbox_TestHarness_AppSceneDelegate: UIResponder {
    /* ################################################################## */
    /**
     The required window property.
     */
    var window: UIWindow?
}

/* ###################################################################################################################################### */
// MARK: UIApplicationDelegate Conformance
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_AppSceneDelegate: UIApplicationDelegate {
    /* ################################################################## */
    /**
     Called as the application has finished its launch prep, and is ready to go.
     
     - parameter: The application instance. Ignored.
     - parameter didFinishLaunchingWithOptions: The launch options (also ignored).
     - returns: true (always).
     */
    func application(_: UIApplication, didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { true }

    // MARK: UISceneSession Lifecycle

    /* ################################################################## */
    /**
     Called to fetch the configuration for a new connection.
     
     - parameter: The application instance. Ignored.
     - parameter configurationForConnecting: The session being connected.
     - parameter options: The connection options (also ignored).
     - returns: A new scene configuration.
     */
    func application(_: UIApplication, configurationForConnecting inConnectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration { UISceneConfiguration(name: "Default Configuration", sessionRole: inConnectingSceneSession.role) }
}

/* ###################################################################################################################################### */
// MARK: UIWindowSceneDelegate Conformance
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_AppSceneDelegate: UIWindowSceneDelegate {
}
