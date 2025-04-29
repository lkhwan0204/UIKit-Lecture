import Foundation

if let input = readLine() {
    let parts = input.split(separator: " ").map { Int($0)! }
    let a = parts[0]
    let b = parts[1]
    
    let sum = a + b
    let average = Double(sum) / 2.0
    
    print("\(sum) \(String(format: "%.1f", average))")
}
