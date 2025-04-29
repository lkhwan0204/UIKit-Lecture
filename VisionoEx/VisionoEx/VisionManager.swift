//
//  VisionManager.swift
//  VisionoEx
//
//  Created by kyuhyeon Lee on 4/25/25.
//


// 파일: VisionManager.swift

import Vision
import UIKit

class VisionManager {
    static func recognizeText(from image: UIImage) {
        guard let cgImage = image.cgImage else { return }

        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            for observation in observations {
                print(observation.topCandidates(1).first?.string ?? "")
            }
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([request])
    }
}
