//
//  Utilities.swift
//  Common iOS/Swift Utilities
//  Tillson Galloway
//

import Foundation

class Utilities {

  static func showAlert(_ title: String, text: String, cancel: String = "Okay", viewController: UIViewController) {
      let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
      let alertAction = UIAlertAction(title: cancel, style: .default, handler: nil)
      alert.addAction(alertAction)
      viewController.present(alert, animated: true, completion: nil)

  }
}

extension String {
    // Remove any instance of a character
    func exclude(_ find:String) -> String {
        return replacingOccurrences(of: find, with: "", options: .regularExpression, range: nil)
    }
    // Replace any instance of a character with another character
    func replaceAll(_ find:String, with:String) -> String {
        return replacingOccurrences(of: find, with: with, options: .regularExpression, range: nil)
    }

    // Return copy of a String with first letter capitalized
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalizedString
        let other = String(characters.dropFirst())
        return first + other
    }

    // Capitalize first letter of String
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension UIView {
    // Turn UIView into UIImage
    func getImage() -> UIImage {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension CLLocation {
    // Shorthand to convert coordinate into CLLocation
    class func from(coordinate: CLLocationCoordinate2D, bearing: Float) -> CLLocation {
        return CLLocation(coordinate: coordinate, altitude: 0.0, horizontalAccuracy: 0.0, verticalAccuracy: 0.0, course: CLLocationDirection(bearing), speed: 0.0, timestamp: Date())
    }
}
