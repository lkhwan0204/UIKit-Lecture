//
//  ARVisionView.swift
//  ARkitEx
//
//  Created by kyuhyeon Lee on 4/25/25.
//


import SwiftUI
import ARKit
import RealityKit

struct ARVisionView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARViewController {
        return ARViewController()
    }

    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {}
}
