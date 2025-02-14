# Change Log

All notable changes to this project will be documented in this file.

## [3.3]

### Breaking

- Changed `\ifsingleauthor` to directly accept two arguments: `\ifsingleauthor{true}{false}`
  This makes usage much easyser and ensures that spaces will not be gobbled up.

  Here is a regex to fix existing code: `(?<=\\ifsingleauthor)(\{.*?\})\\else(\{.*?\})\\fi(\\space)?`
  which you can replace with `$1$2`.

### Fixed

- `abstract` not working for `hsh-article`
- Spelling errors in HsH-Logo

### Added

- Using the `\and` command inside `\author` or `\matrikelnr` now works as expected (#21)

## [3.2]

### Fixed

- missing comma caused \opt{1} to not work (#18)

### Changed

- moved all localization commands into one place

## [3.1]

### Fixed

- implement the `abstract` environment to behave as pre v3
- removed debug print from `latexmk` inkscape recipe

### Added

- option `abstract`
  - `abstract=keywords|nokeywords` to enable/disable the display of keywords after the abstract
  - `abstract=totoc|notoc` to add the abstract to the TOC
- extend KOMA option `toc`
  - `toc=totoc|notoc` to add toc to itself
  - `toc=abstrct|noabstract` as alias for `abstract=totoc` and `abstract=notoc`

## [3.0]

### Breaking

- `config.tex` was renamed to `HsH-classes.cfg`

### Fixed

- no longer leaking `\makeatletter` into userspace

### Changed

- document-option `todos` is now a simple-switch, which means it can be disabled using `todos=off|false` instead of having to remove the option
- use git large-file-storage by default
- lots of behind the seance scenes

### Added

- detailed documentation in `src/HsH-classes.pdf`
- document-option `parskip` to configure inter-paragraph skip-sizes
- document-option `lineheight` to define the spacing between lines

## [2.2]

### Fixed

- make first argument of `\todo` and `\missingfigure` optional (#11)

## [2.1]

### Breaking

- `\declarationAuthorship` is renamed to `\declarationofauthorship`

### Changed

- the margins are now set using relative values, which makes them adapt to different paper sizes
- add alignment parameter to `\declarationofauthorship`, it is still by default aligned to the bottom of the page, but can now be pushed to the top using `\declarationofauthorship[t]`

### Added

- macros for titlepage: `\firstexaminer` and `\secondexaminer`

## [2.0]

### Changed

- switched from normal `Makefile` to `latexmkrc`

## [1.5]

### Added

- autogobble option for `listings`, which automaticly determins the indentation width and gooble it up, removing the need to put `gobble=n` manually
  every time. (#8)
- `todos` class-option. Loads the `todos` package if present but also redefines its commands to have no effect when this option is omitted. Also
  changes the margins to make space for the todo-notes.

### Changed

- `\title` now accepts an optional argument. It will be used as a short version of the title and will be put into the header.

### Fixed

- `\ihead` and `\ohead` now have a max width and will break into multiple lines (#7)
- `\maketitle[r]` now correctly allgines the author+matrikelnumber tabular (#10)


## [1.4] - 2022-03-28

### Added

- defined `\fronmatter`, `\mainmatter` and `\backmatter` for HsH-report class
- included the caption package to fix #6

### Fixes

- references now get point to the top of floats, not to the captions position (#6)


## [1.3] - 2022-03-07

### Changed

- moved the documentation into the README file
- added the outdir into the makefile rule prerequisite
- improved the default settings for the listings package

### Removed

- WIKI has been removed. All its content is now inside the README file.


## [1.2] - 2021-10-24

### Fixed

- Issues that came with the Kernel update from 01.06.2021 are fixed (#2, #3, #4)
- typos

### Added

- defined checklist environment via enumitem-package in `config.tex`
- added required package for enum item


## [1.1] - 2021-04-22

This version provides mostly minor fixed and upgrades.
**IMPORTANT:** the `personal.tex` has been removed

### Added

- Dtx installer file. All class files can be generated from this file. This removes code duplications and allows for more easy maintenance as well as
  deployment. This file will only be available on a separate branch and not be part of the master branch.

### Changed

- Makefile has been reworked. Should now be more stable and easier to understand
- Title page as been improved. You can now align the standard title page as you prefer
- the declaration of authorship now uses the proper babel interface for localization
- Licence is now LPPL

### Removed

- `personal.tex` has been removed. It pretty much not used anyway. All contents have been moved to the project files preamble.


## [1.0] - 2021-03-31

Initial Version. Official first release

### Added

- HsH-article class
- HsH-report class
- HsH-standalone class
- `config.tex` file
- `personal.tex` file
- folder structure, with readme files for every folder
- empty project file
- makefile
- example on the example branch
