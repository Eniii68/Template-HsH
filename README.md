# What this is

This is a template designed to ease the workflow when writing documents for the Hochschule Hannover. It is intended to be used in all sophisticated
works, from lab-reports to masters thesis's.  
The project provides custom document-classes caring the `HsH-` prefix as well as support files. These classes extend the well known KOMA-script classes and customize them
them with specifig configurations and presets as well as providing commonly needed features.  

**Provides classes are:**  

	HsH-article (planed)  
	HsH-report  
	HsH-book (planed)  

# Quick start guide:

## Quick and dirty
To get started, create a new folder for your project somewhere on your PC and create your `.tex` file. Copy the classfile (`.cls`) you want to use and
the `HsH-logo.pdf` from the src folder to your projectfolder. You can optionally copy the `config.tex` and the `personal.tex`, but you can also
configure everything  in your preamble. 

## using a proper subfolder structure

The projects also provides a recommendation for a subfolder structure, to keep things organized. Cloning the complete projekt into your projectfolder
will allow you to use it easily.  
This has the downside of storing classfiles and other needed files in the *.\src* folder, which means it needs to be added to the path searched when
running your latex command. How to do that is explained later on.  
The provided Makefile demonstrates how to run a successful build, you might want to check it out.

## writing your document

Write your Latexdocument as usual, starting with: `\documentclass{HsH-report}`  
You may provide all usual classoptions as well as specifying your fakultae (f1 to f5), so the correct logo can be picked. Here is a recommendation:

	\documentclass[11pt,a4paper,twoside,f1]{HsH-report}

# Adding the .\src folder to the path

The makefile shows how to do this via export of the `TEXINPUTS` variable or with the miktex option.


## using MIKTEX
Miktex makes this very easy by adding a option for that. Just add `-include-directory=.\src` to your call to `pdflatex`.


## using VScode with LaTex Workshop
in VS Code you can configure your launch to set environment variables. Just edit your settings, so that your pdflatex tool contains a `env:`

	"name": "pdflatex",
	"command": "pdflatex",
	"args": [...],
	"env": {
		"TEXINPUTS": "%DIR%/src"
	}

# What are the personal.tex and config.tex?

These files are a easy way to configure your project in a single central location, so it can be used over multiple documents in the same  project as
well as allowing easy reuse of configs for other projects.  
The provide classes automatically check for these files and use them, if they are present. But they are completely optional, so you can just ditch them if
you want to. Keep in mind that the `config.tex` will be included right before the `\begin{document}`, so it overrides all settings you may have put in
your preamble.  

The `personal.tex` is internet for personal information displayed on the titlepage and elsewhere. For example the definitions of `\autor{}` and
`\title{}` are here.  

The `config.tex` is intendet for configurations. For example new- or redefinitions of commands should be put here. Also packages-specific configs are
loaded here. The `\@ifpackageloaded{pakagename}{true}{false}` Makro allows to check for the existenz of a package, so that you can reuse config files,
even if you don't use all the same packages.

# Creating a titlepage

The `\maketitel` command has bin changed from the standart implementation. It now provides a titlepage containing the HsH-logo as well as allowing for
some more stuff.  
Standart KOMA commands (read also [KOMA-documentation](https://golatex.de//wiki/Titelseite_mit_KOMA-Script)):  
`\titlehead{}`  
`\subject{}`  
`\title{}`  
`\subtitle{}`  
`\date{}`  

Custom Commands:  
`\author{A,B,C}` needs to be a comma separated list, to make the declaration of autorship work properly, `\thanks{}` may still be used  
`\publishers{}` has no effect

It is very important, that the HsH-logo file can be found when using this command. The standart config looks on the environment path, but if you want to
customize it, you can use `\HsHlogoPath{path/to/logo}` to provide the path yourself. Note that the `\HsHlogoPage{num}` must also be set to point to the
correct page inside the provided file (standart is 1).

# Declaration of autorship

TODO

	\declarationAuthorship


# other providet commands

`\abs{}` sets vertical lines left and right of the contained expression to mark an absolut value. Only works in mathmode

# Für Beamer gibt es das schon:

https://lab.it.hs-hannover.de/hit/latex-template-service