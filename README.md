# What this is
This is a template designed to ease the workflow when writing documents for the Hochschule Hannover. It is intended to be used in all sophisticated
works, from lab-reports to masters thesis's.  
The project provides custom document-classes caring the `HsH-` prefix as well as support files. These classes extend the well known KOMA-script
classes and customize them them with specific configurations, presets and provide commonly needed features.  

**Provided classes are:**  

	HsH-article
	HsH-report
	HsH-book (planed)
	HsH-standalone

**Version:** 1.1  
**Date:** 21.04.2021  
Check out the [**Example-Branche**](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/tree/example)


# License
This project is distributed under the LaTeX project public license (LPPL), version 1.3c.  


# Quick start guide:

## recomendet Software
As a Tex-Distribution, [MikTex is recommended](https://miktex.org/). This is only avalible on windows though.  
To edit the `.tex` files, you could use any texteditor, but I personally like [Visual Studio Code](https://code.visualstudio.com/) the moste, which
can also be used for pretty much all other programing languages. Use the [Latex Workshop extention](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
and you can steal my config file from [here](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets/111).  
If you preffer a Tex-only editor, I used [Texmaker](https://www.xm1math.net/texmaker/) in the past and it's also very good.  

If you want to use citations in your work, you should get familiar with the `biblatex` package and include it in your project. The classes set it up 
to use `biber` as the backend, which is more modern and has more features than the usual `bibtex`, but you will need to set you editor up to also use
this.

## quick and dirty
To get started, create a new folder for your project somewhere on your PC and create your `.tex` file. Copy the classfile (`.cls`) you want to use and
the `HsH-logo.pdf` from the src folder to your projectfolder. You can optionally copy the `config.tex`, but you can also configure everything  in your
preamble. 

## using a proper subfolder structure
The projects also provides a recommendation for a subfolder structure, to keep things organized. You can [download the .zip-Archive](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/archive/master/latex-template-hsh-master.zip)
and unpack it or clone the repository via `git clone https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh.git`.
This has the downside of storing classfiles and other needed files in the *.\src* folder, which means it needs to be added to the path searched when
running your latex command. [How to do that is explained in the wiki](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Adding-src-folder-to-the-path).  
The provided Makefile demonstrates how to run a successful build, you might want to check it out.


# Common additions and expantions (Snippets)
Sadly most Profs have widly different expectaions when it comes to styling of written works. So you might find yourself having to change some
settings. For some cases this has allready been done and, to help others, uploaded in 
[the snippets section](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets) of the project. Most of them are only visible when you
are logged in!!


# Use the Wiki:
Use the wiki [here](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/home):

- [Adding the src folder to the path](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Adding-src-folder-to-the-path)  
- [Using a Aux folder](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Using-a-Aux-Folder)  
- [What is the config.tex?](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/What-is-the-config.tex)  
- [Document Options](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Document-Options)  
- [Provided commands](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Provided-commands)  
- [Provided and recommended packages](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/Provided-and-recommended-packages)
- [Frequently Asked Questions](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/wikis/faq)  
