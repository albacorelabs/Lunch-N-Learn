//: [Previous](@previous)

import CoreRPC
import Foundation
import PlaygroundSupport
import PromiseKit

PlaygroundPage.current.needsIndefiniteExecution = true

let node = URL(string: "http://user:password@localhost:8332")!
let rpc = try CoreRPC.init(url: node)

firstly {
    rpc.getNewAddress(label: "test", type: nil)
}.done { entry in
    debugPrint(entry)
}.catch { error in
    debugPrint(error)
}

//: [Next](@next)
