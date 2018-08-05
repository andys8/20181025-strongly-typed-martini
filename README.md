A strongly typed martini. Shaken, not stirred. 🍸
===

# Install Liquid Haskell

Requirements:

1. SMTLIB2 compatible solver installed and its executable found on PATH (in our case [Z3](https://github.com/Z3Prover/z3))

* Linux: `sudo apt-get install z3`
* Mac OS: `brew install z3`

2. [Stack](https://docs.haskellstack.org/en/stable/README/)

```
$ wget -qO- https://get.haskellstack.org/ | sh
```

In order to have `stack` installed executable availables we need to modify the `$PATH`. To do that, please add the following line to your `~/.bashrc` or `~/.zshrc`

```
export PATH=$HOME/.local/bin:$PATH
```

And now we proceed to install [Liquid Haskell](https://github.com/ucsd-progsys/liquidhaskell/blob/develop/INSTALL.md)

```
$ git clone --recursive https://github.com/ucsd-progsys/liquidhaskell.git ~/liquidhaskell
$ cd ~/liquidhaskell
$ stack install 
```

# Getting started

(Please be sure you went through the upper section)

To get started with this repository you can easily do:

```
$ stack install
```

So you can get the proper GHC version and dependencies installed.
