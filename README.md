# Pebble V1

Pebble is an alternative scheduler for Frankendancer and Firedancer.

The goal is to increase validator revenue compared to the default
scheduler, while ensuring:

* independence: no reliance on an external block builder,
* compliance with SFDP requirements,
* alignment with expected scheduling behavior under Constellation,
* Jito compatibility, if desired.

Unlike balanced strategy, or Agave greedy scheduler, non-vote
and non-bundled transactions are only scheduled during periodic auctions
(typically, every 45 or 50 ms).

This kind of scheduler, called Frequent Batch Auctions (FBA) or Frequent
Batch Ordering (FBO), requires transaction senders seeking fast
inclusion to compete solely through priority fees, rather than:

* trying to outpace others to reach the validator first, or
* paying tips to one or more transaction landing services in the hope
  that one of them will be able to deliver the transaction sooner, or
  has contracted with the validator or its external block builder for 
  some opaque prioritization.

The key objective is therefore to restore the value of priority fees.

For more technical details, see the comments in `default.toml` and
in the source code

The remainder of this file is the original Firedancer README.

---

# [Firedancer](https://jumpcrypto.com/firedancer/) 🔥💃

Firedancer is a new validator client for Solana.

* **Fast** Designed from the ground up to be *fast*. The concurrency
model draws from experience in the low latency trading space, and the code
contains many novel high-performance reimplementations of core Solana
primitives.
* **Secure** The architecture of the validator allows it to run with a
highly restrictive sandbox and almost no system calls.
* **Independent** Firedancer is written from scratch. This brings client
diversity to the Solana network and helps it stay resilient to supply
chain attacks in build tooling or dependencies.

## Documentation
If you are an operator or looking to run the validator, see the Getting
Started guide in the [Firedancer
docs](https://docs.firedancer.io/)

## Releases
If you are an operator looking to run the validator, see the [Releases
Guide](https://docs.firedancer.io/guide/getting-started.html#releases)
in the documentation.

The Firedancer project is producing two validators,

* **Frankendancer** A hybrid validator using parts of Firedancer and
parts of Agave. Frankendancer uses the Firedancer networking stack and
block production components to perform better while leader. Other
functionality including execution and consensus is using the Agave
validator code.
* **Firedancer** A full from-scratch Firedancer with no Agave code.

Both validators are built from this codebase. The Firedancer validator
is not ready for test or production use and has no releases.
Frankendancer is currently available on both Solana testnet and
mainnet-beta.

## Developing
Firedancer currently only supports Linux and requires a relatively new
kernel, at least v4.18 to build.

```console
$ git clone --recurse-submodules https://github.com/firedancer-io/firedancer.git
$ cd firedancer
$ ./deps.sh +dev
$ make -j run
```

The `make run` target runs the `fddev dev` command. This development
command will ensure your system is configured correctly before creating
a genesis block, some keys, a faucet, and then starting a validator on
the local machine. `fddev` will use `sudo` to make privileged changes to
system configuration where needed. If `sudo` is not available, you may
need to run the command as root.

By default `fddev` will create a new development cluster, if you wish to
join this cluster with other validators, you can define
`[rpc.entrypoints]` in the configuration file to point at your first
validator and run `fddev dev` again.

## License
Firedancer is available under the [Apache 2
license](https://www.apache.org/licenses/LICENSE-2.0). Firedancer also
includes external libraries that are available under a variety of
licenses. See [LICENSE](LICENSE) for the full license text.
