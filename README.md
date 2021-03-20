# What this is

This is a template designed to ease the workflow when writing documents for the Hochschule Hannover. It is intended to be used in all sophisticated
works, from lab-reports to masters thesis's.  
The project provides custom document-classes caring the `HsH-` prefix as well as support files. These classes extend the well known KOMA-script classes and customize them
them with specific configurations and presets as well as providing commonly needed features.  

**Provides classes are:**  

	HsH-article 
	HsH-report  
	HsH-book (planed)  
	HsH-standalone

**Version:** 1.0, 20.03.2021

## Check out the **Example-Branche**

# Requirements:

[MikTex is recommended](https://miktex.org/), TexLive doesn't find some packages, if somebody get's it working, let me know.

`biber`-Backend is standart! If you have Problems with that, check the [FAQ](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/faq). 

The `Makefile` is only tested with mingw32-make.

# Quick start guide:


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


# Use the Wiki:

Use the wiki [here](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/home):

- [Adding the .\src folder to the path](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Adding%20the%20.%5Csrc%20folder%20to%20the%20path)  
- [Using a Build folder](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Using%20a%20Build%20Folder)  
- [What are the personal.tex and config.tex?](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/What%20are%20the%20personal.tex%20and%20config.tex)  
- [setting up a titlepage](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/setting%20up%20a%20titlepage)  
- [Provided commands](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Provided%20commands)  
- [Provided and recommended packages](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Provided%20and%20recommended%20packages)
- [Frequently Asked Questions](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/faq)  
