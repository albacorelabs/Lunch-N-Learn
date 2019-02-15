//: [Previous](@previous)

import Foundation
import PlaygroundSupport

/*:
 ## [Docker Bitcoind](https://github.com/jamesob/docker-bitcoind)

 ## Build

 ```
 git clone https://github.com/jamesob/docker-bitcoind

 DOCKER_BUILDKIT=1 docker build -t bitcoind .
 ```

 #### Configure

 ```
 vim .env

 BTC_RPCUSER=user
 BTC_RPCPASSWORD=password
 BTC_TXINDEX=1
 BTC_DBCACHE=4960
 BTC_TESTNET=0

 ```

 ## Start / Run
 ```
 docker run --name bitcoind -d \
 --env-file=.env \
 --volume /Users/michael/Library/Application\ Support/Bitcoin:/root/.bitcoin \
 -p 127.0.0.1:8332:8332 \
 -p 8333:8333 \
 bitcoind
 ```

 ```
 docker logs -f bitcoind
 ```

*/

//: [Next](@next)
