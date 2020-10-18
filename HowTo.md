# What this is

This is a template designed to ease the workflow when wrighting documents for the Hochschule Hannover. It is intendet to be used in all sufisticated
works, from lab-reporst to masters thesisies.  
The project provieds custom document-classes cariing the `HsH-` prefix as well as support files. These classes extend the well known KOMA-script classes and customise them
them with specifig configurations and presets as well as providing comonly needed features.  

**Provides classes are:**  

	HsH-article (planed)  
	HsH-report  
	HsH-book (planed)  

# Quick start guide:

## Quick and dirty
To get started, create a new folder for your project somewhere on your PC and create your `.tex` file. Copy the classfile (`.cls`) you want to use and
the `HsH-logo.pdf` from the src folder to your projectfolder. You can optionaly copy the `config.tex` and the `personal.tex`, but you can also
configre everything  in your preamble. 

## using a proper subfolder structure

The projects also provieds a recomondation for a subfolder structure, to keep things organised. Cloning the complete projekt into your projectfolder
will allow you to use it easiely. 

## writing your document

Write your Latexdocument as usual, starting with: `\documentclass{HsH-report}`  
You may provide all usuall classoptions as well as specifying your fakultie (f1 to f5), so the correct logo can be picked. Here is a recomendation:

	\documentclass[11pt,a4paper,twoside,f1]{HsH-report}


# What are the presonal.tex and config.tex?

These files are a easy way to configre your project in a single central location, so it can be used over multiple documents in the same  project as
well as allowing easy reuse of configs for other projects.  
The provied classes automaticly check for thes files and use them, if they are present. But they are completly optional, so you can just ditch them if
you want to. Keep in mind that the `config.tex` will be includet rigth befor the `\begin{document}`, so it overides all settings you may have put in
your preamble.  

The `personal.tex` is intednet for presonal information displayed on the titlepage and elsewhere. For example the definitions of `\autor{}` and
`\title{}` are here.  

The `config.tex` is intendet for configurations. For example new- or redefinitions of commands should be put here. Also pakages specifig configs are
loadet here. The `\@ifpackageloaded{pakagename}{true}{false}` Makro allows to check for the existans of a pakage, so that you can reuse config files,
even if you dont use all the same pakeges.

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
`\author{A,B,C}` needs to be a comma seperated list, to make the declaration of autorship work properly, `\thanks{}` may still be used  
`\publishers{}` has no effect

It is very importand, that the HsH-logo file can be found when using this command. The standart config looks on the enviroment path, but if you whant to
customise it, you can use `\HsHlogoPath{path/to/logo}` to provide the path yourself. Note that the `\HsHlogoPage{num}` must also be set to point to the
correct page inside the providet file (standart is 1).

# Declation of autorship

TODO

	\declarationAuthorship


# other providet commands

`\abs{}` sets vertical lines left and right of the contained expression to mark an absolout value. Only works in mathmode