#!/usr/bin/env swift

import Foundation
import Vision

let args = CommandLine.arguments
guard args.count >= 3 else {
    fputs("usage: ocr_validate.swift IMAGE SOURCE_TEXT [MIN_CONFIDENCE]\n", stderr)
    exit(2)
}

let imageURL = URL(fileURLWithPath: args[1])
let sourceURL = URL(fileURLWithPath: args[2])
let minimumConfidence = args.count >= 4 ? Double(args[3]) ?? 0.80 : 0.80

func normalized(_ value: String) -> String {
    value.unicodeScalars.filter { scalar in
        !CharacterSet.whitespacesAndNewlines.contains(scalar) &&
        !CharacterSet.punctuationCharacters.contains(scalar) &&
        !CharacterSet.symbols.contains(scalar)
    }.map(String.init).joined()
}

let expected: String
do {
    expected = try String(contentsOf: sourceURL, encoding: .utf8)
} catch {
    fputs("FAIL: cannot read source text: \(error)\n", stderr)
    exit(1)
}

let request = VNRecognizeTextRequest()
request.recognitionLevel = .accurate
request.usesLanguageCorrection = true
request.recognitionLanguages = ["zh-Hans", "en-US"]

let handler = VNImageRequestHandler(url: imageURL, options: [:])
do {
    try handler.perform([request])
} catch {
    fputs("FAIL: OCR request failed: \(error)\n", stderr)
    exit(1)
}

guard let observations = request.results, !observations.isEmpty else {
    fputs("FAIL: OCR returned no text observations\n", stderr)
    exit(1)
}

let sorted = observations.sorted {
    if abs($0.boundingBox.midY - $1.boundingBox.midY) > 0.02 {
        return $0.boundingBox.midY > $1.boundingBox.midY
    }
    return $0.boundingBox.minX < $1.boundingBox.minX
}

let candidates = sorted.compactMap { observation -> (String, Float)? in
    guard let candidate = observation.topCandidates(1).first else { return nil }
    return (candidate.string, candidate.confidence)
}
let recognized = candidates.map { $0.0 }.joined(separator: "\n")
let expectedCompact = normalized(expected)
let recognizedCompact = normalized(recognized)

func editDistance(_ a: Array<Character>, _ b: Array<Character>) -> Int {
    var previous = Array(0...b.count)
    for (i, left) in a.enumerated() {
        var current = [i + 1]
        for (j, right) in b.enumerated() {
            let cost = left == right ? 0 : 1
            current.append(min(current[j] + 1, previous[j + 1] + 1, previous[j] + cost))
        }
        previous = current
    }
    return previous[b.count]
}

let expectedChars = Array(expectedCompact)
let recognizedChars = Array(recognizedCompact)
let distance = editDistance(expectedChars, recognizedChars)
let denominator = max(max(expectedChars.count, recognizedChars.count), 1)
let similarity = 1.0 - Double(distance) / Double(denominator)
let lowConfidence = candidates.filter { Double($0.1) < minimumConfidence }

print("OCR recognized:")
print(recognized)
print(String(format: "Similarity: %.3f | minimum confidence: %.2f | observations: %d", similarity, minimumConfidence, candidates.count))

if !lowConfidence.isEmpty {
    print("LOW_CONFIDENCE: \(lowConfidence.count) text observations below threshold")
}

if expectedCompact != recognizedCompact || !lowConfidence.isEmpty {
    print("FAIL: OCR text does not exactly match source text or contains low-confidence observations")
    exit(1)
}

print("PASS: OCR text matches source text and all observations meet the confidence threshold")
