%%
%% This is file `HsH-article.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% HsH-classes.dtx  (with options: `article')
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
\ProvidesClass{HsH-article}
  [2024-04-26 3.01 HsH-class based on KOMA]
\let\HsHClassName\@currname
\def\HsHClassName@ParrentClass{%
  scrartcl%
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
\DefineFamilyKey{HsH}{linespacing}{
  \begingroup
  \FamilySetNumerical{HsH}{linespacing}{@tempa}{%
    {single}{0},%
    {onehalf}{1},%
    {double}{2},%
  }{#1}
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \aftergroup\FamilyKeyStateProcessed
    \ifcase\@tempa% 0
      \endgroup
      \if@atdocument\singlespacing\else\AtEndOfClass{\singlespacing}\fi
    \or% 1
      \endgroup
      \if@atdocument\onehalfspacing\else\AtEndOfClass{\onehalfspacing\AfterTOCHead{\singlespacing}}\fi
    \or% 2
      \endgroup
      \if@atdocument\doublespacing\else\AtEndOfClass{\doublespacing\AfterTOCHead{\singlespacing}}\fi

    \else% should never be
      \endgroup
    \fi
  \else
    \endgroup
    \FamilyKeyStateUnknownValue
  \fi
}
\HsH@Options@DeclareAlias{singlespacing}{linespacing=single}
\HsH@Options@DeclareAlias{onehalfspacing}{linespacing=onehalf}
\HsH@Options@DeclareAlias{doublespacing}{linespacing=double}
\DefineFamilyKey{HsH}{parskip}{%
  \begingroup
  \FamilySetNumerical{HsH}{parskip}{@tempa}{%
    {never+}{0},%
    {never*}{1},%
  }{#1}
  \if@atdocument
    \ClassError{\HsHClassName}{
      option `parskip' can only be configured in preamble!
    }
  \fi
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \aftergroup\FamilyKeyStateProcessed
    \ifcase\@tempa% 0
      \endgroup
      \AtEndOfClass{\setparsizes{\z@}{\z@}{.3333\linewidth \@plus 1fil}}
    \or% 1
      \endgroup
      \AtEndOfClass{\setparsizes{\z@}{\z@}{.25\linewidth \@plus 1fil}}
    \else% should never be
      \endgroup
    \fi
  \else
    \endgroup
    \HsH@Options@PassToParrent{parskip=#1}
    \FamilyKeyStateProcessed
  \fi
}
\def\HsH@opt@headheight{}
\FamilyStringKey{HsH}{headheight}{\HsH@opt@headheight}
\AtEndOfClass{%
  \headheight=\HsH@opt@headheight%
}
\newif\if@HsH@option@abstract@show@keywords
\def\HsH@abstract@chap{\addchap*}
\DefineFamilyKey{HsH}{abstract}{%
  \begingroup
  \FamilySetNumerical{HsH}{abstract}{@tempa}{%
    {keywords}{0},%
    {nokeywords}{1},%
    {totoc}{2},{toc}{2},%
    {notoc}{3},{nottotoc}{3},%
  }{#1}
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \aftergroup\FamilyKeyStateProcessed
    \ifcase\@tempa% 0
      \endgroup
      \@HsH@option@abstract@show@keywordstrue
    \or% 1
      \endgroup
      \@HsH@option@abstract@show@keywordsfalse
    \or% 2
      \endgroup
      \def\HsH@abstract@chap{\addchap}
    \or% 3
      \endgroup
      \def\HsH@abstract@chap{\addchap*}
    \else% should never be
      \endgroup
    \fi
  \else
    \endgroup
  \fi
}
\DefineFamilyKey{HsH}{toc}{%
  \begingroup
  \FamilySetNumerical{HsH}{toc}{@tempa}{%
    {totoc}{0},{toc}{0},%
    {notoc}{1},{nottotoc}{1},%
    {abstract}{2},%
    {noabstract}{3},%
  }{#1}
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \aftergroup\FamilyKeyStateProcessed
    \ifcase\@tempa% 0
      \endgroup
      \AtEndOfClass{\setuptoc{toc}{totoc}}
    \or% 1
      \endgroup
      \AtEndOfClass{\unsettoc{toc}{totoc}}
    \or% 2
      \endgroup
      \FamilyExecuteOptions{HsH}{abstract=totoc}
    \or% 3
      \endgroup
      \FamilyExecuteOptions{HsH}{abstract=nottotoc}
    \else% should never be
      \endgroup
    \fi
  \else
    \endgroup
    \HsH@Options@PassToParrent{toc=#1}
    \FamilyKeyStateProcessed
  \fi
}
\DefineFamilyKey{HsH}{twoside}[semi]{%
  \HsH@Options@PassToParrent{twoside=#1,BCOR=1cm}
  \FamilyKeyStateProcessed
}
\def\HsH@opt@language{nil}
\FamilyStringKey{HsH}{language}{\HsH@opt@language}
\HsH@Options@DeclareAlias{english}{language=english}
\HsH@Options@DeclareAlias{german}{language=ngerman}
\HsH@Options@DeclareAlias{ngerman}{language=ngerman}
\def\HsH@opt@faculty{1}
\FamilyNumericalKey{HsH}{faculty}{HsH@opt@faculty}{%
  {0}{1}, {none}{1}, {false}{1}, {off}{1}%
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
\DefineFamilyKey{HsH}{@else@}{
  \HsH@Options@PassToParrent{#1}
  \FamilyKeyStateProcessed
}
\DeclareOption*{
  \HsH@Options@PassToParrent{\CurrentOption}
}
\FamilyExecuteOptions{HsH}{%
  fontfamily=sans-serif,
  fontsize=11pt,
  language=ngerman,
  parskip=never+,
  linespacing=single,
  headheight=2.15\baselineskip,
  toc=listof,
  toc=bibliography,
  abstract=keywords,
  faculty=none,
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
\AtBeginDocument{
  \hypersetup{
    pdfinfo={
      Title={\@title},
      Author={\@author},
      Subject={\@subject},
      Keywords={\@keywords}
    }
  }
}
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
\PassOptionsToPackage{backend=biber}{biblatex}
\AtBeginDocument{
  \makeatletter
  \@ifpackageloaded{biblatex}{
    \renewcommand*{\mkbibacro}[1]{\MakeUppercase{#1}}
  }{}%
  \makeatother
}
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
\let\@author\@empty
\renewcommand{\title}[2][]{
  \gdef\@title{#2}
  \gdef\@shorttitle{#1}
}
\def\@shorttitle{\@empty}
\newcommand{\matrikelnr}[1]{\gdef\@matrikelnr{#1}}
\def\@matrikelnr{\@empty}
\newcommand{\professor}[1]{\gdef\@professor{#1}}
\def\@professor{\@empty}
\newcommand{\firstexaminer}[1]{\gdef\@firstexaminer{#1}}
\def\@firstexaminer{\@empty}
\newcommand{\secondexaminer}[1]{\gdef\@secondexaminer{#1}}
\def\@secondexaminer{\@empty}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\def\@keywords{\@empty}
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
\newif\ifsingleauthor
\AtBeginDocument{
  \begingroup
    \newcount\count@
    \count@=\z@
    \@for\tmp@:=\@author\do{\advance\count@\@ne}
    \ifnum\count@>\@ne\global\singleauthorfalse\else\global\singleauthortrue\fi
  \endgroup
}
\newcommand{\decofauthname}{Declaration of Authorship}
\newcaptionname{english}\decofauthname{Declaration of Authorship}
\newcaptionname{german,ngerman}\decofauthname{Selbstst\"andigkeitserkl\"arung}
\newcommand{\decofauthtext}{Language not supported!}
\newcaptionname{english}\decofauthtext{%
  \ifsingleauthor{I}\else{We}\fi\space hereby certify that the work \ifsingleauthor{I}\else{we}\fi\space
  \ifsingleauthor am\else are\fi\space submitting is entirely of \ifsingleauthor{my}\else{our}\fi own
  making except where otherwise indicated. \ifsingleauthor{I}\else{We}\fi\space
  \ifsingleauthor{am}\else{are}\fi\space aware of regulations concerning plagiarism, including
  disciplinary actions that may result from it. Any use of the works of any other author, in any form,
  is properly acknowledged at their point of use.
}
\newcaptionname{german,ngerman}\decofauthtext{%
  Hiermit best{\"a}tige\ifsingleauthor\else{n}\fi\space \ifsingleauthor ich\else wir\fi, dass die
  folgende Arbeit eigenst{\"a}ndig von \ifsingleauthor{mir}\else{uns}\fi\space allein erstellt und
  unter Ber{\"u}cksichtigung der zur Verf{\"u}gung gestellten Aufgabenstellung sowie dem Arbeitsmaterial
  unter Angabe aller verwendeten Quellen erarbeitet wurde. Die Regelungen und Konsequenzen eines
  Plagiats, inklusive disziplinarischer Ma{\ss}nahmen, sind \ifsingleauthor{mir}\else{uns}\fi\space
  bewusst. Insbesondere wurden alle Zitate und gedanklichen {\"U}bernahmenals solche kenntlich gemacht.
}
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
\areaset[current]{0.75\paperwidth}{0.8\paperheight}
\if@todos
  \addtolength\paperwidth{5cm}
  \addtolength\marginparwidth{5cm}
\fi
\renewcommand{\fps@figure}{h!t}
\renewcommand{\fps@table}{h!t}
\g@addto@macro\@floatboxreset\centering
\setcapwidth{0.8\textwidth}
\defcaptionname{english}\figurename{Fig.}
\defcaptionname{german,ngerman}\figurename{Abb.}
\defcaptionname{english}\tablename{Tab.}
\defcaptionname{german,ngerman}\tablename{Tab.}
\AtBeginDocument{
  \makeatletter
  \@ifpackageloaded{subfigure}{
    \let\subfigureautorefname\figureautorefname
  }{}%
  \makeatother
}
\renewcommand{\labelitemi}{\raisebox{.3ex}{\scalebox{0.7}{$\bullet$}}}
\renewcommand{\labelitemii}{\raisebox{.3ex}{\scalebox{0.7}{$\circ$}}}
\renewcommand{\labelitemiii}{\raisebox{.1ex}{-}}
\renewcommand{\labelitemiv}{\raisebox{-.1ex}{\scalebox{1.3}{$\cdot$}}}
\defcaptionname{german,ngerman}\abstractname{Abstract}
\newcaptionname{english}\keywordsname{Keywords}
\newcaptionname{german,ngerman}\keywordsname{Schl{\"u}sselw{\"o}rter}
\renewenvironment{abstract}{
  \quotation
  \setparsizes{\z@}{\z@}{.25\linewidth \@plus 1fil}\selectfont
  \HsH@abstract@chap{\abstractname}
}{%
  \ifx\@keywords\@empty\else\if@HsH@option@abstract@show@keywords
    \par\bigskip
    \noindent\textbf{\keywordsname}\hskip 2em\@keywords
  \fi\fi\par
  \endquotation
}
\upsubscripts
\raggedbottom
\let\layercontentsmeasure\relax
\RequirePackage{scrlayer-scrpage}
\FamilyOptions{KOMA}{headsepline,singlespacing=true}
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
\clearpairofpagestyles
\ofoot*{\pagemark}
\pagestyle{HsHheadings}
\automark{section}
\newcommand{\professortext}{Professor}
\newcommand{\firstexaminertext}{First examiner}
\newcommand{\secondexaminertext}{Second examiner}
\newcaptionname{english}\professortext{Professor}
\newcaptionname{english}\firstexaminertext{First examiner}
\newcaptionname{english}\secondexaminertext{Second examiner}
\newcaptionname{german,ngerman}\professortext{Professor(in)/Lehrbeauftragte(r)}
\newcaptionname{german,ngerman}\firstexaminertext{Erstpr{\"u}fer(in)}
\newcaptionname{german,ngerman}\secondexaminertext{Zweitpr{\"u}fer(in)}
\newtoks\@tabtoks
\newcommand\addtabtoks[1]{\global\@tabtoks\expandafter{\the\@tabtoks#1}}
\newcommand\eaddtabtoks[1]{\edef\mytmp{#1}\expandafter\addtabtoks\expandafter{\mytmp}}
%%%\newcommand*\resettabtoks{\global\@tabtoks{}}
\newcommand*\printtabtoks{\the\@tabtoks}
\addtokomafont{publishers}{\normalsize}
\g@addto@macro\titlepage{\singlespacing}
\renewcommand\maketitle[1][c]{
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
  \else
    \def\and{%
      \end{tabular}
      \hskip 1em \@plus.17fil
      \begin{tabular}[t]{c}%
    }
  \fi
  \par
  \ifx\@uppertitleback\@empty\else
    \ClassWarning{\KOMAClassName}{%
      non empty \string\uppertitleback\space ignored
      by \string\maketitle\MessageBreak
      in `titlepage=false' mode%
    }
  \fi
  \ifx\@lowertitleback\@empty\else
    \ClassWarning{\KOMAClassName}{%
      non empty \string\lowertitleback\space ignored
      by \string\maketitle\MessageBreak
      in `titlepage=false' mode%
    }
  \fi
  \begingroup
    \let\@param#1
    \ifx\@param\@empty
      \ClassError{\myClassName}{\maketitle\space with empty option}{
        \maketitle[] has been called (with an empty parameter), this doesn't work.
        Use \maketitle instead.
      }
    \fi
    \let\titlepage@restore\relax
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
    \let\@oldmakefnmark\@makefnmark
    \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
    \next@tdpage
    \ifx\@extratitle\@empty
      \ifx\@frontispiece\@empty\else \mbox{}\fi
    \else
      \@makeextratitle
    \fi
    \ifx\@frontispiece\@empty
      \ifx\@extratitle\@empty\else\next@tdpage\fi
    \else
      \next@tpage
      \@makefrontispiece
      \next@tdpage
    \fi
    \global\@topnum=\z@
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
    \vskip 2em
    \begingroup
      \if\@param c\centering\fi
      \if\@param r\raggedleft\fi
      \ifx\@subject\@empty\else
        {\usekomafont{subject}{\@subject\par}}
        \vskip 1.5em
      \fi
      {\usekomafont{title}{\huge\@title\par}}
      \vskip .5em
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
      \vskip 1em
      {\usekomafont{date}{\@date\par}}
      \vskip 1em
      \usekomafont{publishers}{
        \def\arraystretch{1.2}
        \if\@param l\begin{tabular}{@{}l l}\fi
        \if\@param c\begin{tabular}{l l}\fi
        \if\@param r\begin{tabular}{r r@{}}\fi
          \if\@professor\@empty\else\textbf{\professortext:}&\@professor\\\fi
          \if\@firstexaminer\@empty\else\textbf{\firstexaminertext:}&\@firstexaminer\\\fi
          \if\@secondexaminer\@empty\else\textbf{\secondexaminertext:}&\@secondexaminer\\\fi
        \end{tabular}
      }
      \ifx\@dedication\@empty\else
        \vskip 2em
        {\usekomafont{dedication}{\@dedication \par}}%
      \fi
      \par
    \endgroup
    \vskip 2em
    \ifx\titlepagestyle\@empty\else\thispagestyle{\titlepagestyle}\fi
    \@thanks\global\let\@thanks\@empty
  \endgroup
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
    \global\let\@professor\@empty
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
%% End of file `HsH-article.cls'.
