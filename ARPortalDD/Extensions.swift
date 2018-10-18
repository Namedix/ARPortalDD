//
//  Extensions.swift
//  ARPortalDD
//
//  Created by Bartek Pichalski on 18/10/2018.
//  Copyright © 2018 com.pichalski.bartek. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width: CGFloat = 0.2
var height: CGFloat = 1
var lenght: CGFloat = 1

var doorLenght: CGFloat = 0.3

func createBox(isDoor: Bool) -> SCNNode {
    let node = SCNNode()

    // Add First Box
    let firstBox = SCNBox(width: width, height: height,
                          length: isDoor ? doorLenght : lenght,
                          chamferRadius: 0)
    let firstBoxNode = SCNNode(geometry: firstBox)
    firstBoxNode.renderingOrder = 200
    node.addChildNode(firstBoxNode)

    // Add Masked Box
    let maskedBox = SCNBox(width: width, height: height,
                           length: isDoor ? doorLenght : lenght,
                           chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.00001

    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0)

    node.addChildNode(maskedBoxNode)

    return node
}

extension FloatingPoint {
    var degreesToRadians: Self {
        return self * .pi / 180
    }

    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
}

