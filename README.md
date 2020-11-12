# What this is

This is a template designed to ease the workflow when writing documents for the Hochschule Hannover. It is intended to be used in all sophisticated
works, from lab-reports to masters thesis's.  
The project provides custom document-classes caring the `HsH-` prefix as well as support files. These classes extend the well known KOMA-script classes and customize them
them with specific configurations and presets as well as providing commonly needed features.  

**Provides classes are:**  

	HsH-article (planed)  
	HsH-report  
	HsH-book (planed)  
	HsH-standalone

**Version:** BETA 0.2, 02.11.2020

# Requirements:

[MikTex is recommended](https://miktex.org/), TexLive doesn't find some packages, if somebody get's it working, let me know.

`biber`-Backend ist mandatory! You need to change your config to use it as a backend, otherwise you will get errors. See
[here for most editors](https://texwelt.de/fragen/1909/wie-verwende-ich-biber-in-meinem-editor) and [here for VS Code](https://tex.stackexchange.com/questions/459640/implementing-biber-for-biblatex-in-microsoft-visual-studio-code/459933#459933)

The `Makefile` is only tested with mingw32-make.

# Quick start guide:

Use the wiki [here](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/home).

## Quick and dirty
To get started, create a new folder for your project somewhere on your PC and create your `.tex` file. Copy the classfile (`.cls`) you want to use and
the `HsH-logo.pdf` from the src folder to your projectfolder. You can optionally copy the `config.tex` and the `personal.tex`, but you can also
configure everything  in your preamble. 

## using a proper subfolder structure

The projects also provides a recommendation for a subfolder structure, to keep things organized. Cloning the complete projekt into your projectfolder
will allow you to use it easily.  
This has the downside of storing classfiles and other needed files in the *.\src* folder, which means it needs to be added to the path searched when
running your latex command. [How to do that is explained in the wiki](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Adding%20the%20.%5Csrc%20folder%20to%20the%20path).  
The provided Makefile demonstrates how to run a successful build, you might want to check it out.
