# Lunch-N-Learn: Haskell


## Installing Haskell

```brew install haskell-stack```

This will include Stack, the build tool we will be using to ensure we don't end up in dependency hell thanks to Cabal

## Installing Haskero for VS Code

Haskell development (especially at the start) can be tedious if you need to run ghc everytime to see if you types compose. Running Haskero with VS Code allows us to do type checking within our editor

- Install vscode (https://code.visualstudio.com/)
- Install 'code' in your $PATH to make it easier to open VSCode (https://code.visualstudio.com/docs/setup/mac)
- Search for and install **Haskero** from the list of extensions in VSCode
- Run ```stack build intero``` within a stack project
- Re-launch VSCode using ```code .```

## Running the week's code

Each week's project code will be its own self-contained Stack project

``` cd <project-file> ```

``` stack build ``` --> Builds the executables

```stack ghci``` --> To access the GHC REPL


