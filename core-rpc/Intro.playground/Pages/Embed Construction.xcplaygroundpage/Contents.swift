//: [Previous](@previous)

import CoreRPC
import Foundation
import PlaygroundSupport
import PromiseKit

PlaygroundPage.current.needsIndefiniteExecution = true

// src/qt/bitcoin-qt -regtest -debug=rpc

let node = URL(string: "http://user:password@localhost:18443")! // regtest
let rpc = try CoreRPC.init(url: node)

// echo -n "hello" | sha256sum

let params = CoreRPC.CreateRawParams(
    inputs: [], // no inputs, added in fundraw
    outputs: [CoreRPC.CreateRawParams.DataOutput(data: "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9823")],
    locktime: nil,
    replaceable: nil)


firstly {
    rpc.createRawTransaction(params: params)
}.then { created in
    rpc.fundRawTransaction(hex: created)
}.then { funded in
    rpc.signRawTransactionWithWallet(hex: funded.hex)
}.then { signed in
    rpc.sendrawtransaction(hex: signed.hex)
}.done {
    debugPrint("TXID: \($0)")
}.catch { error in
    if let rpcfail = error as? CoreRPCError {
        debugPrint(rpcfail.message())
    } else {
        debugPrint(error)
    }
}

// get some coins
// getnewaddress
// bcrt1q3660s7ja3gqcpm9hkweh947070fjsdjvpac4nu
// generatetoaddress 101 bcrt1q3660s7ja3gqcpm9hkweh947070fjsdjvpac4nu

//: [Next](@next)
