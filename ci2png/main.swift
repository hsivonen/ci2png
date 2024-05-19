/* Any copyright is dedicated to the Public Domain.
 * https://creativecommons.org/publicdomain/zero/1.0/ */

import Foundation
import CoreImage

if CommandLine.arguments.count != 3 {
    print("Must have two arguments: input file and PNG output file")
    exit(1)
}

let inUrl = URL(fileURLWithPath: CommandLine.arguments[1])
let outUrl = URL(fileURLWithPath: CommandLine.arguments[2])

let image = CIImage(contentsOf: inUrl, options: [.expandToHDR: true])!
let colorSpace = CGColorSpace(name: CGColorSpace.itur_2100_PQ)!
let context = CIContext()
try context.writePNGRepresentation(of: image, to: outUrl, format: .RGBA16, colorSpace: colorSpace, options: [:])
