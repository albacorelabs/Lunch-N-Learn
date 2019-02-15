//: [Previous](@previous)

import CoreRPC
import Foundation
import PlaygroundSupport
import PromiseKit

PlaygroundPage.current.needsIndefiniteExecution = true

let node = URL(string: "http://user:password@localhost:8332")!
let rpc = try CoreRPC.init(url: node)

// zmq
// all

firstly {
    rpc.getLoggingInfo(include: [], exclude: [.all])
}.done {
    debugPrint($0)
}

// docker container stop bitcoind

//: [Next](@next)
