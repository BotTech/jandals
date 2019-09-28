# Jandals

> You don't need a bootstrap when you use Jandals!

Jandals main goal is to bootstrap a new development environment with no prerequisites.

Chances are you are not a [Kiwi] so you are probably wondering "[what the heck is a jandal]"? So now that is out of the way...

Okay so we failed already, there are _some_ prerequisites:
1. You need a modern operating system with a [supported shell](#supported-shells).
1. To have [setup an OpenPGP key](docs/OpenPGP.md).

Jandals will do the following things:
1. Install and configure the Package Manager.
1. Install the runtime environment (Python 3).
1. Download and install the rest of itself.
- This will be custom until the point where Jandals itself is able to be managed by the Package Manager.
1. Setup the rest of the environment.

## Supported Shells

| OS | Shell | Package Manager |
--------------------------------
| macOS (10.14.x - Mojave) | [Bash](#bash) | [Homebrew] |

### Bash

Run:
```
bash <(curl -s https://raw.githubusercontent.com/BotTech/jandals/master/bin/jandals.sh)
```


[homebrew]: https://brew.sh/
[kiwi]: https://en.wikipedia.org/wiki/Kiwi_(people)
[what the heck is a jandal]: https://en.wikipedia.org/wiki/Flip-flops#Etymology
