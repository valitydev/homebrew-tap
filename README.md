# Valitydev Tap

Homebrew formulae that allows installation of Vality tools through the [Homebrew](https://brew.sh/) package manager.

## Installation

```
brew tap valitydev/tap
brew install <FORMULA>
```

## Update

```
$ brew uninstall vality-thrift
$ brew tap valitydev/tap
$ brew update   
$ brew install vality-thrift     
$ brew install woorl
$ thrift -version    
Thrift version 0.19.0
```

## Formulae

| Repository                                           | Formula                             | Description                     |
| ---------------------------------------------------- | ----------------------------------- | ------------------------------- |
| [woorl](https://github.com/valitydev/woorl)          | [formula](Formula/woorl.rb)         | Woody curl client               |
| [vality-thrift](https://github.com/valitydev/thrift) | [formula](Formula/vality-thrift.rb) | Vality version of Apache Thrift |

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh/)
