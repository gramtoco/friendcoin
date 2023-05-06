Fren Core integration/staging tree
=====================================

https://frencoin.org

To see how to run Frencoin, please read the respective files in [the doc folder](doc)


What is Frencoin?
----------------

Frencoin is an experimental digital Fren system that enables instant Fren transfers to
anyone, anywhere in the world. Frencoin uses peer-to-peer technology to operate
with no central authority: managing transactions and issuing money are carried
out collectively by the network. 



License
-------

Fren Core is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see https://opensource.org/licenses/MIT.

Development Process
-------------------

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/Apushii/Frencoin/tags) are created
regularly to indicate new official, stable release versions of Fren Core.

Active development is done in the `develop` branch. 

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md).

Developer IRC is inactive please join us on discord when somebody makes one in #development. 

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test on short notice. Please be patient and help out by testing
other people's pull requests, and remember this is a security-critical project where any mistake might risk failure.

Testnet will eventually be running and available to use during development.

### Automated Testing

Eventually developers are strongly encouraged to write [unit tests](src/test/README.md) for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`. Further details on running
and extending unit tests can be found in [/src/test/README.md](/src/test/README.md).

There are also [regression and integration tests](/test), written
in Python, that are run automatically on the build server.
These tests can be run (if the [test dependencies](/test) are installed) with: `test/functional/test_runner.py`


### Manual Quality Assurance (QA) Testing

Changes should be tested by somebody other than the developer who wrote the
code. This is especially important for large or high-risk changes. It is useful
to add a test plan to the pull request description if testing the changes is
not straightforward.


About Frencoin
----------------
A Peer to Peer Electronic System for the Creation and Transfer of Frens.

Thank you to the Bitcoin and Ravencoin developers. 

The Frencoin project is launched based on the hard work and continuous effort of over 400 Bitcoin developers who made over 16,500 commits over the life to date of the Bitcoin project. We are eternally grateful to you for your efforts and diligence in making a secure network and for their support of free and open source software development.  The Frencoin experiment is made on the foundation you built.


Abstract
----------------
Frencoin is a blockchain and platform optimized for making frens and for one fren to send another fren lots of frens. Based development and testing on the UTXO model of the Bitcoin and Ravencoin protocol, Frencoin is built on a fork of the Bitcoin and Ravencoin code. Key changes include a block reward time of 20 seconds, a change in the number of coins issued, Dogecoin distribution and halving time schedule, future addition of token creation, and future messaging capabilities. Frencoin is free and open source. All Frencoin (FRENS) are fairly issued and mined publicly and transparently using Proof of Work (POW) using the KAWPOW algorithm which was created for Ravencoin from ProgPow which was created for Ethereum. There is no private, public, founder, or developer allocation set aside. Frencoin is intended to prioritize security, user control, privacy, and censorship resistance. It is open to use and development in any jurisdiction.


A blockchain is a ledger showing the value of Frens and allowing Frens to be transferred to another Fren. Of all the possible uses for blockchains, the reporting of who has Frens is one of the core uses of the technology.  This is the first and most successful Fren case for blockchain technology to date.

Frencoin is a platform coin built on the UTXO model of Bitcoin and Ravencoin. Modifying Bitcoin code to make frens seemed unlikely, but Frencoin is a platform built from a code fork and issuing newly mined FRENS. Frencoin will possibly be adding tokens, rewards, unique assets, messaging, and voting. The code base is designed allow users and developers to maintain a secure, decentralized, and tamper resistant network.

The Frencoin project can also serve as a base and starting point for projects, second layer solutions, experiments, and business ideas which might benefit from either the Bitcoin-based code base with adjustments or the native additional features added to the Frencoin blockchain.

