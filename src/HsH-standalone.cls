%%
%% This is file `HsH-standalone.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% HsH-classes.dtx  (with options: `standalone,localisation')
%% 
%% Copyright (C) 2024 by Jan Wille <mail@janiwlle.de>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{HsH-standalone}
  [2024-06-14 3.03.pre0 HsH-class based on KOMA]
\let\HsHClassName\@currname
\def\HsHClassName@ParrentClass{%
  standalone%
}
\RequirePackage{scrbase}
\RequirePackage{setspace}
\DefineFamily{HsH}
\DefineFamilyMember{HsH}
\newcommand{\HsH@Options@PassToParrent}[1]{%
  \ClassInfoNoLine{\HsHClassName}{passing option to parrent class: #1}%
  \PassOptionsToClass{#1}{\HsHClassName@ParrentClass}%
}
\newcommand{\HsH@Options@DeclareAlias}[3][HsH]{%
  \DeclareOption{#2}{\FamilyExecuteOptions{#1}{#3}}%
}
\DefineFamilyKey{HsH}{fontfamily}{
  \begingroup
  \FamilySetNumerical{HsH}{parskip}{@tmp}{%
    {sans}{0}, {sans-serif}{0},%
    {roman}{1}, {serif}{1},%
  }{#1}
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \aftergroup\FamilyKeyStateProcessed
    \ifcase\@tmp% 0
      \endgroup
      \renewcommand{\familydefault}{\sfdefault}
      \if@atdocument\AfterKOMAoptions{\selectfont}\fi
    \or% 1
      \endgroup
      \renewcommand{\familydefault}{\rmdefault}
      \if@atdocument\AfterKOMAoptions{\selectfont}\fi
    \else% should never be
      \endgroup
    \fi
  \else
    \endgroup
    \FamilyKeyStateUnknownValue
  \fi
}
\HsH@Options@DeclareAlias{sans}{fontfamily=sans}
\HsH@Options@DeclareAlias{roman}{fontfamily=roman}
\def\HsH@opt@language{nil}
\FamilyStringKey{HsH}{language}{\HsH@opt@language}
\HsH@Options@DeclareAlias{english}{language=english}
\HsH@Options@DeclareAlias{german}{language=ngerman}
\HsH@Options@DeclareAlias{ngerman}{language=ngerman}
\def\HsH@opt@faculty{1}
\FamilyNumericalKey{HsH}{faculty}{HsH@opt@faculty}{%
  {0}{1}, {none}{1}, {false}{1}, {off}{1},%
  {1}{2}, {f1}{2},%
  {2}{3}, {f2}{3},%
  {3}{4}, {f3}{4},%
  {4}{5}, {f4}{5},%
  {5}{6}, {f5}{6},%
}
\HsH@Options@DeclareAlias{f1}{faculty=f1}
\HsH@Options@DeclareAlias{f2}{faculty=f2}
\HsH@Options@DeclareAlias{f3}{faculty=f3}
\HsH@Options@DeclareAlias{f4}{faculty=f4}
\HsH@Options@DeclareAlias{f5}{faculty=f5}
\FamilyBoolKey{HsH}{todos}{@todos}
\DefineFamilyKey{HsH}{fontsize}{%
  \ClassInfoNoLine{\HsHClassName}{The `fontsize' option is only a mock, its has not effect}
  \FamilyKeyStateProcessed
}
\DefineFamilyKey{HsH}{@else@}{
  \HsH@Options@PassToParrent{#1}
  \FamilyKeyStateProcessed
}
\DeclareOption*{
  \HsH@Options@PassToParrent{\CurrentOption}
}
\FamilyExecuteOptions{HsH}{%
  fontfamily=sans-serif,
  faculty=none,
  margin=0.25cm,
  multi=tikzpicture,
  multi=circuitikz,
}
\FamilyProcessOptions{HsH}\relax
\LoadClass{\HsHClassName@ParrentClass}
\RequirePackage[T1]{fontenc}
\RequirePackage{type1ec}
\RequirePackage[main=\HsH@opt@language]{babel}
\RequirePackage[autostyle=true]{csquotes}
\MakeOuterQuote{"}
\iflanguage{ngerman}{\RequirePackage{ziffer}}{}
\RequirePackage[hidelinks]{hyperref} % must load before `bookmarks'
\RequirePackage{bookmark}
\if@todos
  \PassOptionsToPackage{
    textsize=small,
    figwidth=.6\textwidth
  }{todonotes}
  \RequirePackage{todonotes}
\else
  \newcommand{\listoftodos}[1]{}
  \newcommand{\todo}[2][]{}
  \newcommand{\missingfigure}[2][]{}
\fi
\RequirePackage[hypcap=true]{caption}
\RequirePackage{graphicx}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage[svgnames]{xcolor}
\PassOptionsToPackage{free-standing-units}{siunitx}
\AtBeginDocument{
  \makeatletter
  \@ifpackageloaded{siunitx}{
    \iflanguage{ngerman}{
      \sisetup{output-decimal-marker={,}}
    }{}
  }{}
  \makeatother
}
\RequirePackage{scrhack}
\AtBeginDocument{
  \makeatletter
  \@ifpackageloaded{listings}{
    \RequirePackage{lstautogobble}\lstset{autogobble=true}
    \iflanguage{ngerman}{
      \lstset{literate={Ö}{{\"O}}1{Ä}{{\"A}}1{Ü}{{\"U}}1{ß}{{\ss}}1{ü}{{\"u}}1{ä}{{\"a}}1{ö}{{\"o}}1}
    }{}
  }{}
  \makeatother
}
\PassOptionsToPackage{european,EFvoltages,straightvoltages,betterproportions}{circuitikz}
\AtBeginDocument{
  \makeatletter
  \InputIfFileExists{HsH-classes.cfg}{
    \ClassInfo{\HsHClassName}{Local config file HsH-classes.cfg used.}
  }{
    \ClassInfo{\HsHClassName}{No HsH-classes.cfg!! I hope you configered it yourself.}
  }
  \makeatother
}
\newcommand{\HsHlogoPath}{HSH-Logo.pdf}
\newcommand{\HsHlogoPage}{\HsH@opt@faculty}
\newcommand{\includeHsHlogohere}[1][5cm]{
  \IfFileExists{\HsHlogoPath}{
    \includegraphics[width=#1,page=\HsHlogoPage]{\HsHlogoPath}
  }{
    \ClassError{\HsHClassName}{\HsHlogoPath\space not found!}{
      The HsH Logo is necasary for the titlepage! Try putting it next to your source file or use \HsHlogoPath to define the file location
    }
  }
}
\RequirePackage{pgffor}
\newcommand{\declarationofauthorship}[1][b]{
  \if#1b
    \vspace*{\fill}
    \hrule
  \else\if#1t
    \vspace*{2em}
  \else
    \ClassError{\HsHClassName}{Wrong Parameter for `\declarationofauthorship'}{
      `\string\declarationofauthorship' only accepts `t' and `b' as parameters.
    }
  \fi\fi
  \vskip 3em
  {\centering\bfseries\usekomafont{section}{\decofauthname}\par}
  \vskip 3em
  \decofauthtext\par
  \begingroup
    \renewcommand{\thanks}{\sbox0}
    \raggedleft
    \foreach \tmp@ in \@author {
      \if\tmp@\empty\else
        \hskip 1em \parbox{4cm}{
          \vskip 4em
          \hrule\vskip 4pt
          \raggedleft\footnotesize\tmp@
        }%
      \fi
    }\par
  \endgroup
}
\newif\if@singleauthor
\AtBeginDocument{
  \begingroup
    \newcount\count@
    \count@=\z@
    \@for\tmp@:=\@author\do{\advance\count@\@ne}
    \ifnum\count@>\@ne\global\@singleauthorfalse\else\global\@singleauthortrue\fi
  \endgroup
}
\newcommand{\ifsingleauthor}[2]{\if@singleauthor#1\else#2\fi}
\def\declarationAuthorship{%
  \ClassWarning{\HsHClassName}{%
    Command \string\declarationAuthorship\space is deprecate.\MessageBreak
    Replace it with \string\declarationofauthorship.
  }%
  \declarationofauthorship%
}
\newcommand{\abs}[1]{\ensuremath{\left\vert#1\right\vert}}
\def\@subinrm#1{\sb{\mathrm{#1}}}
{\catcode`\_=13 \global\let_=\@subinrm}
\newcommand\upsubscripts{\catcode`\_=12}
\newcommand\normalsubscripts{\catcode`\_=8}
\RequirePackage{lmodern}
\renewcommand{\labelitemi}{\raisebox{.3ex}{\scalebox{0.7}{$\bullet$}}}
\renewcommand{\labelitemii}{\raisebox{.3ex}{\scalebox{0.7}{$\circ$}}}
\renewcommand{\labelitemiii}{\raisebox{.1ex}{-}}
\renewcommand{\labelitemiv}{\raisebox{-.1ex}{\scalebox{1.3}{$\cdot$}}}
\upsubscripts
\raggedbottom
\let\layercontentsmeasure\relax
\newcaptionname{english}\professorname{Professor}
\newcaptionname{german,ngerman}\professorname{Professor(in)/Lehrbeauftragte(r)}
\newcaptionname{english}\firstexaminername{First examiner}
\newcaptionname{german,ngerman}\firstexaminername{Erstpr{\"u}fer(in)}
\newcaptionname{english}\secondexaminername{Second examiner}
\newcaptionname{german,ngerman}\secondexaminername{Zweitpr{\"u}fer(in)}
\newcaptionname{english}\decofauthname{Declaration of Authorship}
\newcaptionname{german,ngerman}\decofauthname{Selbstst{\"a}ndigkeitserkl{\"a}rung}
\newcaptionname{english}\decofauthtext{%
  \ifsingleauthor{I}{We} hereby certify that the work \ifsingleauthor{I}{we}
  \ifsingleauthor{am}{are} submitting is entirely of \ifsingleauthor{my}{our}
  own making except where otherwise indicated. \ifsingleauthor{I}{We}
  \ifsingleauthor{am}{are} aware of regulations concerning plagiarism,
  including disciplinary actions that may result from it. Any use of the
  works of any other author, in any form, is properly acknowledged at
  their point of use.
}
\newcaptionname{german,ngerman}\decofauthtext{%
  Hiermit best{\"a}tige\ifsingleauthor{}{n} \ifsingleauthor{ich}{wir},
  dass die folgende Arbeit eigenst{\"a}ndig von \ifsingleauthor{mir}{uns}
  allein erstellt und unter Ber{\"u}cksichtigung der zur Verf{\"u}gung
  gestellten Aufgabenstellung sowie dem Arbeitsmaterial unter Angabe aller
  verwendeten Quellen erarbeitet wurde. Die Regelungen und Konsequenzen
  eines Plagiats, inklusive disziplinarischer Ma{\ss}nahmen, sind
  \ifsingleauthor{mir}{uns} bewusst. Insbesondere wurden alle Zitate und
  gedanklichen {\"U}bernahmen als solche kenntlich gemacht.
}
\newcaptionname{english}\keywordsname{Keywords}
\newcaptionname{german,ngerman}\keywordsname{Schl{\"u}sselw{\"o}rter}
\endinput
%%
%% End of file `HsH-standalone.cls'.
