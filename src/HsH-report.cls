%%
%% This is file `HsH-report.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% HsH-classes.dtx  (with options: `report')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2021 by Jan Wille <mail@janwille.de>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2021/01/01 or later.
%% 
\typeout{Adapted from KOMA script for use in Hochschule Hannover <2023-08-11> Jan Wille}
\NeedsTeXFormat{LaTeX2e}
\newcommand{\myClassName}{HsH-report}
\ProvidesClass{\myClassName}[2023/08/11 v2.0 HsH-Class based on KOMA]

%% commands for HsH-logo
\newcommand{\HsHlogoPath}{HSH-Logo.pdf}
\newcommand{\HsHlogoPage}{1}
\newcommand{\includeHsHlogohere}[1][5cm]{
  \IfFileExists{\HsHlogoPath}{}{
    \ClassError{\myClassName}{HsH-Logo.pdf not found!}{
      The HsH Logo is necasary for the titlepage! Try putting it next to your source file or use \HsHlogoPath to define the file location
    }
  }
  \includegraphics[width=#1,page=\HsHlogoPage]{\HsHlogoPath}
}
\newif\if@german%
\newif\if@todos\@todosfalse%

%% document options -------------------------------------------------------------------------------
\DeclareOption{german}{
  \@germantrue
}
\DeclareOption{ngerman}{
  \@germantrue
}
\DeclareOption{english}{
  \@germanfalse
}
\DeclareOption{f1}{
  \renewcommand{\HsHlogoPage}{2}
}
\DeclareOption{f2}{
  \renewcommand{\HsHlogoPage}{3}
}
\DeclareOption{f3}{
  \renewcommand{\HsHlogoPage}{4}
}
\DeclareOption{f4}{
  \renewcommand{\HsHlogoPage}{5}
}
\DeclareOption{f5}{
  \renewcommand{\HsHlogoPage}{6}
}
\DeclareOption{sans}{
  \renewcommand{\familydefault}{\sfdefault}
}
\DeclareOption{roman}{
  \renewcommand{\familydefault}{\rmdefault}
}
\DeclareOption{todos}{
  \@todostrue
}
%% defere all other options to the base class
\DeclareOption*{\expandafter\PassOptionsToClass\expandafter{\CurrentOption}{scrreprt}}
\ExecuteOptions{fontsize=11pt,a4paper,ngerman,sans} % default options
\ProcessOptions\relax
%% Load KOMA class
\LoadClass{scrreprt}
\KOMAoption{toc}{bibliography,listof}

%% package loading and config ---------------------------------------------------------------------
\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}
\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\PassOptionsToPackage{vmargin=5\baselineskip,bindingoffset=0.08\paperwidth,textwidth=0.75\paperwidth}{geometry}
\if@todos
  \setlength{\marginparwidth}{6cm}
  \PassOptionsToPackage{paperwidth=\dimexpr +0.915\paperwidth+\marginparsep+\marginparwidth+0.25cm, right=\dimexpr +\marginparsep+\marginparwidth+0.25cm}{geometry}
\else
  \PassOptionsToPackage{nomarginpar}{geometry}
\fi
\RequirePackage{geometry}
\if@german
  \PassOptionsToPackage{ngerman}{babel}
\else
  \PassOptionsToPackage{english}{babel}
\fi
\RequirePackage{babel}
\iflanguage{ngerman}{\RequirePackage{ziffer}}{}%
\PassOptionsToPackage{headsepline}{scrlayer-scrpage}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{scrhack}
\PassOptionsToPackage{hidelinks}{hyperref}
\RequirePackage{hyperref}
\PassOptionsToPackage{hypcap=true}{caption}
\RequirePackage{caption}
\RequirePackage{bookmark}
\PassOptionsToPackage{babel}{csquotes}
\iflanguage{ngerman}{\PassOptionsToPackage{german=quotes}{csquotes}}{}%
\RequirePackage{csquotes}
\MakeOuterQuote{"}
\if@todos
  \PassOptionsToPackage{svgnames}{xcolor}
  \PassOptionsToPackage{
    textsize=small,
    figwidth=.6\textwidth
  }{todonotes}
  \RequirePackage{todonotes}
  \setlength{\marginparwidth}{5.2cm}
\else
    \newcommand{\listoftodos}[1]{}
    \newcommand{\todo}[2]{}
    \newcommand{\missingfigure}[2]{}
\fi
\RequirePackage{pgffor}
%% options for not loaded packages ----------------------------------------------------------------
\PassOptionsToPackage{backend=biber,style=alphabetic,sorting=nyt}{biblatex}
\PassOptionsToPackage{free-standing-units}{siunitx}
\PassOptionsToPackage{european,EFvoltages,straightvoltages,betterproportions}{circuitikz}

%% title matters ----------------------------------------------------------------------------------
\newcommand*{\@shorttitle}{\@empty}
\renewcommand{\title}[2][]{
  \gdef\@title{#2}
  \gdef\@shorttitle{#1}
}
\newcommand*{\@matrikelnr}{}
\newcommand{\matrikelnr}[1]{\gdef\@matrikelnr{#1}}
\newcommand*{\@professor}{}
\newcommand{\professor}[1]{\gdef\@professor{#1}}
\newcommand*{\@firstexaminer}{}
\newcommand{\firstexaminer}[1]{\gdef\@firstexaminer{#1}}
\newcommand*{\@secondexaminer}{}
\newcommand{\secondexaminer}[1]{\gdef\@secondexaminer{#1}}
\newcommand*{\@keywords}{}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\let\@author\@empty
\let\@keywords\@empty

%% typesetting indexes upright or standart
\def\subinrm#1{\sb{\mathrm{#1}}}
{\catcode`\_=13 \global\let_=\subinrm}
\newcommand\upsubscripts{\catcode`\_=12 }
\newcommand\normalsubscripts{\catcode`\_=8 }
\upsubscripts

%% header and footer
\clearpairofpagestyles
\ofoot*{\pagemark}
\newpagestyle{HsHheadings}{
  {
    \parbox[b]{\sls@headwidth}{
      \LaTeXraggedright
      \ifx\@shorttitle\@empty\@title\else\@shorttitle\fi
    }%
  }
  {
    \parbox[b]{\sls@headwidth}{
      \LaTeXraggedleft
      \leftmark
    }%
  }
  {
    \parbox[b]{.45\sls@headwidth}{
      \LaTeXraggedright
      \ifx\@shorttitle\@empty\@title\else\@shorttitle\fi
    }%
    \hfill
    \parbox[b]{.45\sls@headwidth}{
      \LaTeXraggedleft
      \headmark
    }%
  }
  (\textwidth,.1pt)
}{
  {\pagemark}
  {\hfill\pagemark}
  {\hfill\pagemark}
}
\pagestyle{HsHheadings}
\automark{chapter}
\renewcommand*{\chapterpagestyle}{HsHheadings}

%% floats
\renewcommand{\fps@figure}{h!t}
\renewcommand{\fps@table}{h!t}
\ifx\KOMAScriptVersion\undefined\else
  \g@addto@macro\@floatboxreset\centering
  \setcapwidth{0.8\textwidth}
\fi
\iflanguage{english}{
  \renewcaptionname{english}{\figurename}{Fig.}
  \renewcaptionname{english}{\tablename}{Tab.}
}{}%
\iflanguage{ngerman}{
  \renewcaptionname{ngerman}{\figurename}{Abb.}
  \renewcaptionname{ngerman}{\tablename}{Tab.}
  \renewcaptionname{ngerman}{\abstractname}{Abstract}
}{}%

%% styling for itemize
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
\renewcommand{\labelitemiii}{$-$}
\renewcommand{\labelitemiv}{$\cdot$}

%% do stuff
\setlength\parindent{0pt}
\raggedbottom
\let\layercontentsmeasure\relax

%% define easy shorthands to switch pagenumbering
\newif\if@mainmatter\@mainmattertrue
\newcommand*\frontmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi
  \@mainmatterfalse\pagenumbering{Roman}%
}
\newcommand*\mainmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi
  \@mainmattertrue\pagenumbering{arabic}%
}
\newcommand*\backmatter{%
  \if@openright\cleardoubleoddpage\else\clearpage\fi
  \@mainmatterfalse\pagenumbering{roman}%
}

%% custom commands
\newcommand{\uproman}[1]{\uppercase\expandafter{\romannumeral#1}}
\newcommand{\lowroman}[1]{\romannumeral#1\relax}

%% load config at beginning of document
\AtBeginDocument{
  \makeatletter
  \@ifpackageloaded{biblatex}{
    \renewcommand*{\mkbibacro}[1]{\MakeUppercase{#1}}
  }{}
  \@ifpackageloaded{subfigure}{
    \newcommand{\subfigureautorefname}{\figureautorefname}
  }{}
  \InputIfFileExists{config.tex}{
    \ClassInfo{\myClassName}{config.tex was found. Using it...}
  }{
    \ClassInfo{\myClassName}{no config.tex!! I hope you configered it yourself.}
  }
  %% provide some usefull commands:
  \providecommand{\abs}[1]{\ensuremath{\left\vert#1\right\vert}}
  \makeatother
}
%% nicer abstract ---------------------------------------------------------------------------------
\renewenvironment{abstract}{
  \quotation
  \setlength\parindent{0pt}
  \addchap{\abstractname}
}{%
  \ifx\@keywords\@empty\else
    \vskip 2em
    \paragraph{%
      \iflanguage{english}{Keywords}{}%
      \iflanguage{ngerman}{Schlüsselwörter}{}%
    }
    \@keywords
  \fi
  \endquotation
}
%% declaration of Authorship ----------------------------------------------------------------------
\iflanguage{english}{
  \setlocalecaption{english}{authorshipdeclaration}{Declaration of Authorship}
}{}%
\iflanguage{ngerman}{
  \setlocalecaption{ngerman}{authorshipdeclaration}{Selbstst\"andigkeitserkl\"arung}
}{}%
\newif\if@oneAuthor \@oneAuthortrue
\newcommand{\declarationofauthorship}[1][b]{
  \let\@param#1
  \renewcommand{\thanks}{\sbox0}
  \foreach \x [count=\i] in \@author{\ifnum\i>1\global\@oneAuthorfalse\fi}
  \thispagestyle{plain}
  \if\@param b\vspace*{\fill}\fi
  {\rule{\textwidth}{0.1pt}}
  \vskip 3em
  {\centering\huge\bfseries\authorshipdeclarationname\par}
  \vskip 3em
  \iflanguage{english}{
    \if@oneAuthor I\else We\fi\space hereby certify that the work \if@oneAuthor I\else we\fi\space \if@oneAuthor am\else are\fi\space submitting
    is entirely of \if@oneAuthor my\else our\fi own making except where otherwise indicated. \if@oneAuthor I\else We\fi\space
    \if@oneAuthor am\else are\fi\space aware of regulations concerning plagiarism, including disciplinary actions that may result from it. Any use
    of the works of any other author, in any form, is properly acknowledged at their point of use. \par
  }{}%
  \iflanguage{ngerman}{
    Hiermit best{\"a}tige\if@oneAuthor\else n\fi\space \if@oneAuthor ich\else wir\fi, dass die folgende Arbeit eigenst{\"a}ndig von
    \if@oneAuthor mir\else uns\fi\space allein erstellt und unter Ber{\"u}cksichtigung der zur Verf{\"u}gung gestellten Aufgabenstellung sowie dem
    Arbeitsmaterial unter Angabe aller verwendeten Quellen erarbeitet wurde. Die Regelungen und Konsequenzen eines Plagiats, inklusive
    disziplinarischer Ma{\ss}nahmen, sind \if@oneAuthor mir\else uns\fi\space bewusst. Insbesondere wurden alle Zitate und gedanklichen {\"U}bernahmen
    als solche kenntlich gemacht. \par
  }{}%
  {\raggedleft
    \foreach \x in \@author{
      \begin{tabular}[t]{r}
        \\[3em]
        \rule{4cm}{0.4pt}\\
        {\footnotesize\x}
      \end{tabular}
    }
  \par}
  \if\@param t\vspace*{\fill}\fi
}
\let\declarationAuthorship\declarationofauthorship

%% reconfig Titlepage -----------------------------------------------------------------------------
\iflanguage{english}{
  \setlocalecaption{english}{professor}{Professor}
  \setlocalecaption{english}{firstexaminer}{First examiner}
  \setlocalecaption{english}{secondexaminer}{Second examiner}
}{}%
\iflanguage{ngerman}{
  \setlocalecaption{ngerman}{professor}{Professor(in)/Lehrbeauftragte(r)}
  \setlocalecaption{ngerman}{firstexaminer}{Erstpr{\"u}fer(in)}
  \setlocalecaption{ngerman}{secondexaminer}{Zweitpr{\"u}fer(in)}
}{}%
\newtoks\@tabtoks
\newcommand\addtabtoks[1]{\global\@tabtoks\expandafter{\the\@tabtoks#1}}
\newcommand\eaddtabtoks[1]{\edef\mytmp{#1}\expandafter\addtabtoks\expandafter{\mytmp}}
\newcommand*\printtabtoks{\the\@tabtoks}
\addtokomafont{publishers}{\normalsize}
\renewcommand\maketitle[1][l]{
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
  \else
    \def\and{%
      \end{tabular}
      \hskip 1em \@plus.17fil
      \begin{tabular}[t]{c}%
    }
  \fi
  \begin{titlepage}
    \let\@param#1
    \ifx\@param\@empty
      \ClassError{\myClassName}{\maketitle\space with empty option}{
        \maketitle[] has been called with an empty parameter, this doesn't work. Use \maketitle instead.
      }
    \fi
    \if@titlepageiscoverpage
      \edef\titlepage@restore{
        \noexpand\endgroup
        \noexpand\global\noexpand\@colht\the\@colht
        \noexpand\global\noexpand\@colroom\the\@colroom
        \noexpand\global\vsize\the\vsize
        \noexpand\global\noexpand\@titlepageiscoverpagefalse
        \noexpand\let\noexpand\titlepage@restore\noexpand\relax
      }
      \begingroup
      \topmargin=\dimexpr \coverpagetopmargin-1in\relax
      \oddsidemargin=\dimexpr \coverpageleftmargin-1in\relax
      \evensidemargin=\dimexpr \coverpageleftmargin-1in\relax
      \textwidth=\dimexpr
      \paperwidth-\coverpageleftmargin-\coverpagerightmargin\relax
      \textheight=\dimexpr
      \paperheight-\coverpagetopmargin-\coverpagebottommargin\relax
      \headheight=0pt
      \headsep=0pt
      \footskip=\baselineskip
      \@colht=\textheight
      \@colroom=\textheight
      \vsize=\textheight
      \columnwidth=\textwidth
      \hsize=\columnwidth
      \linewidth=\hsize
    \else
      \let\titlepage@restore\relax
    \fi
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
    \let\@oldmakefnmark\@makefnmark
    \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
    \ifx\@extratitle\@empty
      \ifx\@frontispiece\@empty\else
        \if@twoside\mbox{}\next@tpage\fi
        \noindent\@frontispiece\next@tdpage
      \fi
    \else
      \noindent\@extratitle
      \ifx\@frontispiece\@empty
      \else
        \next@tpage
        \noindent\@frontispiece
      \fi
      \next@tdpage
    \fi
    \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
    \vspace*{1cm}
    \begin{minipage}[t]{\textwidth}%
      \ifx\@titlehead\@empty \else
        \usekomafont{titlehead}{\@titlehead}%
      \fi
      \hfill
      \raisebox{0pt}[\ht\strutbox][\dp\strutbox]{\includeHsHlogohere}
    \end{minipage}
    \raisebox{10pt}{\rule{\textwidth}{0.5pt}}
    \null
    \vfill
    \begingroup
      \if\@param c\centering\fi
      \if\@param r\raggedleft\fi
      \ifx\@subject\@empty\else
        {\usekomafont{subject}{\@subject\par}}
        \vskip 3em
      \fi
      {\usekomafont{title}{\huge\@title\par}}
      \vskip 1em
      {\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}
      \vskip 4em
      {\ifx\@matrikelnr\@empty
        \if\@author\@empty\else\usekomafont{author}{
          \parbox{\dimexpr\linewidth}{
            \if\@param c\centering\fi
            \if\@param r\raggedleft\fi
            \@author
          }
        }\fi
      \else
        \if\@author\@empty\else
          % sneeky comma needed after \@matrikelnr to deal with single item lists
          \foreach \x [count=\i,evaluate=\i as \y using {{\@matrikelnr,}[\i-1]}] in \@author {\eaddtabtoks{\x & \y\protect\\}}
          \usekomafont{author}{
            \def\arraystretch{1.2}
            \if\@param l\begin{tabular}{@{}l l}\printtabtoks\end{tabular}\fi
            \if\@param c\begin{tabular}{l l}\printtabtoks\end{tabular}\fi
            \if\@param r\begin{tabular}{r r@{}}\printtabtoks\end{tabular}\fi
          }%
        \fi
      \fi}
      \vskip 1.5em
      {\usekomafont{date}{\@date\par}}
      \vskip \z@ \@plus3fill
      \usekomafont{publishers}{
        \def\arraystretch{1.2}
        \if\@param l\begin{tabular}{@{}l l}\fi
        \if\@param c\begin{tabular}{l l}\fi
        \if\@param r\begin{tabular}{r r@{}}\fi
          \if\@professor\@empty\else\textbf{\professorname:}&\@professor\\\fi
          \if\@firstexaminer\@empty\else\textbf{\firstexaminername:}&\@firstexaminer\\\fi
          \if\@secondexaminer\@empty\else\textbf{\secondexaminername:}&\@secondexaminer\\\fi
        \end{tabular}
      }
      \par
    \endgroup
    \vskip 3em
    \@thanks\global\let\@thanks\@empty
    \vfill\null
    \if@twoside
      \@tempswatrue
      \expandafter\ifnum \@nameuse{scr@v@3.12}>\scr@compatibility\relax
      \else
        \ifx\@uppertitleback\@empty\ifx\@lowertitleback\@empty
          \@tempswafalse
        \fi\fi
      \fi
      \if@tempswa
        \next@tpage
        \begin{minipage}[t]{\textwidth}
          \@uppertitleback
        \end{minipage}\par
        \vfill
        \begin{minipage}[b]{\textwidth}
          \@lowertitleback
        \end{minipage}\par
        \@thanks\global\let\@thanks\@empty
      \fi
    \else
      \ifx\@uppertitleback\@empty\else
        \ClassWarning{\KOMAClassName}{%
          non empty \string\uppertitleback\space ignored
          by \string\maketitle\MessageBreak
          in `twoside=false' mode%
        }
      \fi
      \ifx\@lowertitleback\@empty\else
        \ClassWarning{\KOMAClassName}{%
          non empty \string\lowertitleback\space ignored
          by \string\maketitle\MessageBreak
          in `twoside=false' mode%
        }
      \fi
    \fi
    \ifx\@dedication\@empty
    \else
      \next@tdpage\null\vfill
      {\centering\usekomafont{dedication}{\@dedication \par}}%
      \vskip \z@ \@plus3fill
      \@thanks\global\let\@thanks\@empty
      \cleardoubleemptypage
    \fi
    \ifx\titlepage@restore\relax\else\clearpage\titlepage@restore\fi
  \end{titlepage}
  \setcounter{footnote}{0}
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
    \let\thanks\relax
    \let\maketitle\relax
    \let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@subtitle\@empty
    \global\let\@extratitle\@empty
    \global\let\@frontispiece\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\@matrikelnr\@empty
    \global\let\@prof\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\matrikelnr\relax
    \global\let\professor\relax
  \fi
  \global\let\and\relax
}
\endinput
%%
%% End of file `HsH-report.cls'.
