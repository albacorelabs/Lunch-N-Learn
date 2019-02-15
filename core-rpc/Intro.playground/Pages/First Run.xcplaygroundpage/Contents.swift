//: [Previous](@previous)
import CoreRPC
import Foundation
import PlaygroundSupport
import PromiseKit

PlaygroundPage.current.needsIndefiniteExecution = true

let node = URL(string: "http://user:password@localhost:8332")! // Mainnet
let rpc = try CoreRPC.init(url: node)

firstly {
    rpc.getBlockHash(block: 500100)
}.done { hash in
    debugPrint(hash)
}.catch { error in
    if let rpcFailure = error as? CoreRPCError {
        debugPrint(rpcFailure.message())
    } else {
        debugPrint("Caught: \(error)")
    }
}


//: [Next](@next)
