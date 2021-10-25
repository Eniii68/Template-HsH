# Change Log
All notable changes to this project will be documented in this file.


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
 - dtx installer file. All class files can be generated from this file. This removes code duplications and allows for more easy maintenance as well as
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
