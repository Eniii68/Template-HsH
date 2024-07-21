# LaTeX Template for Hochschule Hannover (mostly Fakulty I)

[![GitLab badge](https://img.shields.io/badge/-GitLab-blue?logo=gitlab&labelColor=gray)](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh)
[![LaTeX badge](https://img.shields.io/badge/-LaTeX-informational?logo=latex&labelColor=gray)](https://www.latex-project.org/)
[![HsH badge](https://img.shields.io/static/v1?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBmaWxsPSIjZmZmIiBkPSJtMTMuNDUzIDBjLTAuNzQ2NTYgMC0xLjM4MjkgMC42MzY0Mi0xLjM4MjkgMS4zOTQ2djM0LjE0NmMwIDAuNzQ2NTYgMC42MzYzIDEuNDAwNCAxLjM4MjkgMS40MDA0aDIuNjg1NmMwLjc0NjU2IDAgMS4zODQ4LTAuNjQwOCAxLjM4NDgtMS40MDA0di0xNS4xNTFoMTIuOTQydjE1LjE1MWMwIDAuNzQ2NTYgMC42MzYzIDEuNDAwNCAxLjM4MjkgMS40MDA0aDIuNjg1NmMwLjc0NjU2IDAgMS4zODI5LTAuNjQwOCAxLjM4MjktMS40MDA0di0zNC4xNDZjMC0wLjc0NjU2LTAuNjM2My0xLjM5NDYtMS4zODI5LTEuMzk0NmgtMi42ODU2Yy0wLjc0NjU2IDAtMS4zODI5IDAuNjM2NDItMS4zODI5IDEuMzk0NnYxMy44MjVoLTEyLjk0MnYtMTMuODI1YzAtMC43NTgxNi0wLjYzODI3LTEuMzk0Ni0xLjM4NDgtMS4zOTQ2em0wIDQyLjQ1M2MtMC43NDY1NiAwLjAxNTEyLTEuMzgyOSAwLjY2NTYtMS4zODI5IDEuNDEyMnYyLjcyNDdjMCAwLjc2MTU2IDAuNjM2MyAxLjQxMDIgMS4zODI5IDEuNDEwMmgyMS4wOTVjMC43NDY1NiAwIDEuMzgyOS0wLjY0ODY2IDEuMzgyOS0xLjQxMDJ2LTIuNzI0N2MwLTAuNzYxNTYtMC42MzYzLTEuNDEyMi0xLjM4MjktMS40MTIyeiIvPjwvc3ZnPg%3D%3D&label=&labelColor=gray&message=Hochschule+Hannover&color=blue)](https://hs-hannover.de/)
<br>
[![version badge](https://img.shields.io/gitlab/v/release/987?gitlab_url=https%3A%2F%2Flab.it.hs-hannover.de)](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/releases)

## What this is

This is a template designed to ease the workflow when writing documents for the
Hochschule Hannover. It is intended to be used in all sophisticated works, from
lab-reports to master’s thesis's. \
The project provides custom document-classes caring
the `HsH-` prefix as well as support files. These classes extend the well known
KOMA-Script classes and customize them with specific configurations, presets and provide
commonly needed features.

## Documentation

This project provides a set of additional classes designed for use in the Hochschule
Hannover, Germany. They extend the well-known
[KOMA-Script classes](https://ctan.org/pkg/koma-script) by adding styling and providing
some additional commands.

You can find the full documentation of all features in
[src/HsH-classes.pdf](src/HsH-classes.pdf), but here is a short description of the
different classes:

<dl>
  <dt><code>HsH-article</code></dt>
  <dd>
    Based on the <code>scrartcl</code> this class is designed for quick and compact documents. It does
    not have chapters and therefore never breaks to a new page on its own. This class is
    useful for writing lab-protocols and alike.
  </dd>

  <dt><code>HsH-report</code></dt>
  <dd>
    This is probably the most useful class. It is based on the <code>scrreprt</code> and can be used
    for a wide variety of documents, beginning with lab-reports and ending at complete
    thesis. The line between article and report is somewhat blurry, so use as you see fit.
  </dd>

  <dt><code>HsH-book</code></dt>
  <dd>
    // ToDo has no been required up to this point
  </dd>

  <dt><code>HsH-beamer</code></dt>
  <dd>
    // ToDo may be interesting, but also not requried up to now
  </dd>

  <dt><code>HsH-standalone</code></dt>
  <dd>
    A helper class based on the normal <code>standalone</code> class. It is designed only for creating
    images as separate documents to keep things organized and compiler times low. It is
    useful for creating graphs, circuit diagrams or other kind of complex sub documents.
  </dd>
</dl>

## Quick start guide

### I have now Idea how to start, show me 🔍

To get you started, there is a working example Project on the example branch that has
loads of tips. Check it out
[Online](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/tree/example) or
locally using `git checkout example`.

### Recommended software

As a tex-distribution, [MiKTeX is recommended](https://miktex.org/), TexLive should also
work, but I don't use it much. You will also need `perl` to run `latexmk` and other
useful tools. To edit the `.tex` files, you could use any text editor, but I personally
like [Visual Studio Code](https://code.visualstudio.com/) the most, which can also be
used for pretty much all other programming languages. Use the
[Latex Workshop extension](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop).

If you have [`winget`](https://docs.microsoft.com/en-us/windows/package-manager/winget)
(windows new, build in package manager) and just want to install everything without any
fuzz, use the following command:

```powershell
winget install "MiKTeX.MiKTeX" "StrawberryPerl.StrawberryPerl" "Git.Git" "Microsoft.VisualStudioCode"
code --install-extension "James-Yu.latex-workshop"
```

### Using the project as a template

The projects also provides a recommendation for a subfolder structure to keep things
organized. If you don't want to use git and just want to get started in LaTeX,
[download the zip-Archive](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/archive/master/latex-template-hsh-master.zip)
and unpack it.

It is recommended you use git to take full advantage of its features (like having backups
and being able to easily see what changed from the last version) and also be able to
easily update should a newer version of this repo be released. First create a new,
**empty** project on the platform of your choice (for example here on
<https://lab.it.hs-hannover.de>), than you can use the following to set it up locally on
your system.

> **Note** replace `[Project]` with your projects name (for example "_Report_") and
> `[Project_URL]` with the git-url for the project you created on the online git
> platform

```shell
# set up local git repo from template
git clone -o upstream https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh.git [Project]
cd [Project]
git branch -M [Project] # optional if you want to seperate your branch from origin/master
git remote add origin [Project_URL]
git push --set-upstream origin
# optionally do some cleanup (linux syntax, adjust when needed)
rm CHANGELOG.md LICENSE
mv project.tex [Project].tex
echo "# [Project]" > README.md
git commit --all -m "initalise for [Project]"
git push
```

> **Note** giving your `[Project]` name as the default branch name is optional, and you could
> keep the default name of `master`, but as the template also has a `master` branch it is
> less confusing if you choose a different name.

### Compiling

The Project comes with setting for `latexmk`, so you should be able to instantly compile
using it.

```shell
latexmk
```

> **Note** If you use the recommended folder-structure, it stores the class files and
> other needed files in the _./src_ folder. If you use `latexmk` this is already
> configured correctly, but might be relevant if you choose a different build system
> ([see below](#adding-src-to-path)).

## Common additions and expansions (Snippets)

Sadly most Profs have widely different expectations when it comes to styling of written
works. So you might find yourself having to change some settings. For some cases this
has already been done and, to help others, uploaded in
[the snippets' section](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets)
of the project.

Also, if you create your own set of additions that are useful for other, feel free to
contact me and I will give you access right, so you can upload it there.

## Frequently Asked Questions

### How can I create my own title page

If you don't like the title page, feel free to create your own. You can simply redefine
the `\maketitle` command to you liking.

Before you go to town, check out what others already published in
[the snippets section](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets).
This will be a good starting point or maybe even already be what you want.

### How can I increase the left margin for printing?

What you are trying to mmodify is called the "bindin correction". The option for that is `BCOR`.
You can set it to any size know to LaTeX and the margin will be increased accordingly,
always on the left side for `oneside` documents and alternating for `twoside` documents.

> **Note** the textarea is not reduced, only moved. So a very large value for `BCOR` will
> move the content off the page.

### Why doens't VScode automcompletion work?

For the [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop) extention to know about
the commands and packages provided by the HsH-classes, it needs a spectial file.
This file is not part of the extention itself but provided by this repo. You need to tell
your VScode about this by adding the folder containing the file to the
`latex-workshop.intellisense.package.dirs` list.


### Italic vs. upright Index? (changing subscript)

The classes by default set all sub scripts upright ("steil" in German), because this is
required in Germany in most cases. You can deactivate this permanently with
`\normalsubscripts` and reactivate it with `\upsubscripts`.

If you want to change it for a single use, you can use the original Tex Macro `\sb{}`
instead of the `_` to get the original behaviour.

> **Warning** DO NOT use `_\math..{}`! This would be a nested font change and lead to
> unexpected results. `\sb{\math..{}}` is possible.

### Adding _./src_ to path

You need to do this if you get errors like this:

> ! LaTeX Error: File \`HsH-report.cls' not found.

Usually the `latexmkrc` files handles setting this up, but if you have problems or just
want more control,
[here](https://lab.it.hs-hannover.de/qxx-tul-u1/latex-template-hsh/-/snippets/121) are
more details.

## LaTeX errors

> You have requested document class \`src/HsH-report', but the document class provides
> \`HsH-report'.

This happens when you tried to use something like `\documentclass{src/HsH-report}`,
which was a good idea, but doesn't quite work. You need to properly add the `src`
directory to the path searched by LaTeX (as explained [here](#adding-src-to-path)). You
can than simply use `\documentclass{HsH-report}`.

## BibTeX errors

> Sorry, but BibTeX did not succeed

You are probably using `bibtex` as your backend, but `biber` the standard configuration.
You can change it, see
[here for most editors](https://texwelt.de/fragen/1909/wie-verwende-ich-biber-in-meinem-editor)
and
[here for VS Code](https://tex.stackexchange.com/questions/459640/implementing-biber-for-biblatex-in-microsoft-visual-studio-code/459933#459933)
or use `\usepackage[backend=bibtex]{biblatex}` in your preamble to keep using BibTeX.
