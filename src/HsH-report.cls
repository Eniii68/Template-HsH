\typeout{Adapted from KOMA script for use in Hochschule Hannover <2021-03-18> Jan Wille}
\NeedsTeXFormat{LaTeX2e}

\newcommand{\myClassName}{HsH-report}
\ProvidesClass{\myClassName}[2021/03/18 HsH-Report based on KOMA]

\newcommand{\HsHlogoPath}{HSH-Logo.pdf}
\newcommand{\HsHlogoPage}{1}
\newif\if@german%

\DeclareOption{german}{%
	\PassOptionsToPackage{ngerman}{babel}
	\@germantrue
}
\DeclareOption{ngerman}{%
	\PassOptionsToPackage{\CurrentOption}{babel}
	\@germantrue
}
\DeclareOption{english}{%
	\PassOptionsToPackage{\CurrentOption}{babel}
	\@germanfalse
}
\DeclareOption{f1}{% use logo of fakulty 1
	\renewcommand{\HsHlogoPage}{2}
}
\DeclareOption{f2}{% use logo of fakulty 2
	\renewcommand{\HsHlogoPage}{3}
}
\DeclareOption{f3}{% use logo of fakulty 3
	\renewcommand{\HsHlogoPage}{4}
}
\DeclareOption{f4}{% use logo of fakulty 4
	\renewcommand{\HsHlogoPage}{5}
}
\DeclareOption{f5}{% use logo of fakulty 5
	\renewcommand{\HsHlogoPage}{6}
}
\DeclareOption{sans}{% use san serif font
	\renewcommand{\familydefault}{\sfdefault}
}
\DeclareOption{roman}{% use roman/serif font
	\renewcommand{\familydefault}{\rmdefault}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}

\ExecuteOptions{fontsize=11pt,a4paper,sans} % standart options
\ProcessOptions\relax

% Load KOMA class
\LoadClass{scrreprt}
\KOMAoption{toc}{bibliography,listof}

% standart options for packages
\PassOptionsToPackage{utf8}{inputenc}
\PassOptionsToPackage{T1}{fontenc}
\PassOptionsToPackage{left=3cm,right=2.5cm,top=3cm,bottom=3cm}{geometry}
\PassOptionsToPackage{hidelinks}{hyperref}
\PassOptionsToPackage{headsepline}{scrlayer-scrpage}
\PassOptionsToPackage{babel}{csquotes}
\if@german\PassOptionsToPackage{german=quotes}{csquotes}\fi

\PassOptionsToPackage{backend=biber,style=alphabetic,sorting=nyt}{biblatex}
\PassOptionsToPackage{free-standing-units,abbreviations}{siunitx}
\PassOptionsToPackage{european,EFvoltages,straightvoltages,betterproportions}{circuitikz}

% used packages:
\RequirePackage{inputenc} % inputencoding, utf8 recomendet
\RequirePackage{fontenc} % outputencoding, T1 recomendet
\RequirePackage{lmodern} % font
\RequirePackage{babel} % required for german names
\RequirePackage{geometry} % required for changing layout
\RequirePackage{scrlayer-scrpage} % required for header and footer
\RequirePackage{scrhack} % compatability with listings
\RequirePackage{pgffor} % foreach loops
\RequirePackage{graphicx} % required for importing images
\RequirePackage{hyperref} % references and lists are clikable
\RequirePackage{bookmark} % generat bookmarkes
\RequirePackage{amsmath} % a lot of nice Math
\RequirePackage{csquotes} % quotations
\if@german\RequirePackage{ziffer}\fi % german dezimal numbers


% internal commands
\newtoks\@tabtoks
\newcommand\addtabtoks[1]{\global\@tabtoks\expandafter{\the\@tabtoks#1}}
\newcommand\eaddtabtoks[1]{\edef\mytmp{#1}\expandafter\addtabtoks\expandafter{\mytmp}}
%\newcommand*\resettabtoks{\global\@tabtoks{}}
\newcommand*\printtabtoks{\the\@tabtoks}

% config for title, header and footer
\newcommand*{\@matrikelnr}{}%
\newcommand{\matrikelnr}[1]{\gdef\@matrikelnr{#1}}%
\newcommand*{\@prof}{}%
\newcommand{\professor}[1]{\gdef\@prof{#1}}%
\let\@author\@empty
\InputIfFileExists{personal.tex}{
	\ClassInfo{\myClassName}{personal.tex was found. Using it...}
}{
	\ClassInfo{\myClassName}{no personal.tex! Configre the titlepage yourselfe}
}
\pagestyle{scrheadings}
\clearpairofpagestyles
\renewcommand*{\chapterpagestyle}{scrheadings} % Chaptertitles get same header/footer as everything
\automark{chapter}
\ohead{\headmark}
\ihead{\@title}
\ofoot*{\pagemark}

% typesetting indexes upright or standart
\def\subinrm#1{\sb{\mathrm{#1}}}
{\catcode`\_=13 \global\let_=\subinrm}
\mathcode`_="8000
\newcommand\upsubscripts{\catcode`\_=12 } % the toggle for upright subscripts
\newcommand\normalsubscripts{\catcode`\_=8 } % the toggle for italic subscripts
\upsubscripts % setting upright as default

% styling for itemize
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
\renewcommand{\labelitemiii}{$-$}
\renewcommand{\labelitemiv}{$\cdot$}

% do stuff
\setlength\parindent{0pt} % indentation of new paragraphs
\raggedbottom
\renewcommand{\fps@figure}{h!t} % positioning of figures
\renewcommand{\fps@table}{h!t} % Positonierung of tables
\renewcommand{\layercontentsmeasure}{\empty} % rulers when using draft disabled
\MakeOuterQuote{"} % easy quotationmarks

% custom commands
\newcommand{\includeHsHlogohere}[1][5cm]{\includegraphics[width=#1,page=\HsHlogoPage]{\HsHlogoPath}}
\providecommand{\abs}[1]{\ensuremath{\left\vert#1\right\vert}} % Makro for vertical lines around absolute values
\newcommand{\uproman}[1]{\uppercase\expandafter{\romannumeral#1}}
\newcommand{\lowroman}[1]{\romannumeral#1\relax}
\newcommand\declarationAuthorship{
	\thispagestyle{plain}
	\vspace*{\fill}
	{\rule{\textwidth}{0.1pt}}
	\vspace{0.5cm}
	\renewcommand{\thanks}{\sbox0}

	\if@german{
		\newcommand{\pronomen}{ich}
		\newcommand{\plutalendung}{}
		\newcommand{\genitiv}{mir}
		\foreach \x [count=\i] in \@author{
			\ifnum\i>1
				\gdef\pronomen{wir}
				\gdef\plutalendung{n}
				\gdef\genitiv{uns}
			\else\fi
		}
		\begin{center}
			\huge \textbf{Selbstständigkeitserklärung}\\
		\end{center}
		\vspace{1cm}\normalsize
		Hiermit bestätige\plutalendung\space\pronomen, dass die folgende Arbeit eigenständig von \genitiv\space allein erstellt und unter
		Berücksichtigung der zur Verfügung gestellten Aufgabenstellung sowie dem Arbeitsmaterial unter Angabe aller verwendeten Quellen erarbeitet
		wurde. Die Regelungen und Konsequenzen eines Plagiats, inklusive disziplinarischer Maßnahmen, sind \genitiv\space bewusst. Insbesondere wurden
		alle Zitate und gedanklichen Übernahmen als solche kenntlich gemacht.
	}\else{
		\newcommand{\pronomen}{I}
		\newcommand{\pronomenf}{I}
		\newcommand{\genitiv}{my}
		\newcommand{\proniomeverb}{am}
		\foreach \x [count=\i] in \@author{
			\ifnum\i>1
				\gdef\pronomen{we}
				\gdef\pronomenf{We}
				\gdef\genitiv{our}
				\gdef\proniomeverb{are}
			\else\fi
		}
		\begin{center}
			\huge \textbf{Declaration of Authorship}\\
		\end{center}
		\vspace{1cm}\normalsize
		\pronomenf\space hereby certify that the work \pronomen\space\proniomeverb\space submitting is entirely of \genitiv\space own making except
		where otherwise indicated. \pronomenf\space\proniomeverb\space aware of regulations concerning plagiarism, including disciplinary actions that
		may result from it. Any use of the works of any other author, in any form, is properly acknowledged at their point of use.
	}\fi
	\begin{flushright}
		\foreach \x [count=\i] in \@author{
			\begin{tabular}[t]{r}
				\\[3em]
				\rule{4cm}{0.4pt} \\
				{\footnotesize\x}
			\end{tabular}
		}
	\end{flushright}
}

\renewenvironment{abstract}{%
	\chapter*{\centering\abstractname}
	\addcontentsline{toc}{chapter}{\abstractname}
		\small
		\quotation
}{%
	\endquotation
}

% load config at beginning of document
\AtBeginDocument{
	\makeatletter
	\@ifpackageloaded{biblatex}{
		\renewcommand*{\mkbibacro}[1]{\MakeUppercase{#1}} % solves fontype warning in San-Serif
	}{}%
	\@ifpackageloaded{subfigure}{
		\newcommand{\subfigureautorefname}{\figureautorefname}
	}{}%
	\InputIfFileExists{config.tex}{
		\ClassInfo{\myClassName}{config.tex was found. Using it...}
	}{
		\ClassInfo{\myClassName}{no config.tex!! I hope you configered it yourself.}
	}
	\makeatother
}

% reconfig Titlepage
\renewcommand\maketitle[1][l]{%
	\expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
	\else
		\def\and{%
			\end{tabular}%
			\hskip 1em \@plus.17fil%
			\begin{tabular}[t]{c}%
		}%
	\fi
	\begin{titlepage}
		% \setcounter{page}{%
		% 	#1%
		% }%
		\def\@param{#1}
		\ifx\@param\@empty\ClassError{\myClassName}{\maketitle\space with empty option}{
				\maketitle[] has been called with an empty parameter, this doesn't work. Use \maketitle instead.
			}
		\fi
		\if@titlepageiscoverpage
			\edef\titlepage@restore{%
				\noexpand\endgroup
				\noexpand\global\noexpand\@colht\the\@colht
				\noexpand\global\noexpand\@colroom\the\@colroom
				\noexpand\global\vsize\the\vsize
				\noexpand\global\noexpand\@titlepageiscoverpagefalse
				\noexpand\let\noexpand\titlepage@restore\noexpand\relax
			}%
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
			\ifx\@frontispiece\@empty
			\else
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
		\IfFileExists{\HsHlogoPath}{}{
			\ClassError{\myClassName}{HsH-Logo.pdf not found!}{
				The HsH Logo is necasary for the titlepage! Try putting it next to your source file or use \HsHlogoPath to define the file location
			}
		}
		\vspace*{1cm}
		\begin{minipage}[t]{\textwidth}%
			\ifx\@titlehead\@empty \else
				\usekomafont{titlehead}{\@titlehead}%
			\fi
			\hfill
			\raisebox{0pt}[\ht\strutbox][\dp\strutbox]{\includeHsHlogohere} % image referrencepoint in lower left corner
		\end{minipage}
		\raisebox{10pt}{\rule{\textwidth}{0.5pt}}
		\null\vfill
		\if\@param c\begin{center}\fi
		\if\@param r\begin{flushright}\fi
			\ifx\@subject\@empty \else
				{\usekomafont{subject}{\@subject\par}}%
				\vskip 3em
			\fi
			{\usekomafont{title}{\huge\@title\par}}%
			\vskip 1em
			{\ifx\@subtitle\@empty\else\usekomafont{subtitle}{\@subtitle\par}\fi}%
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
					% sneeky comma needed after \@matrikelnr to deal with single item list
					\foreach \x [count=\i,evaluate=\i as \y using {{\@matrikelnr,}[\i-1]}] in \@author {\eaddtabtoks{\x & \y\protect\\}}
					\usekomafont{author}{\def\arraystretch{1.2}
						\if\@param l\hspace{-6pt}\begin{tabular}{l l}\printtabtoks\end{tabular}\fi
						\if\@param c\begin{tabular}{l l}\printtabtoks\end{tabular}\fi
						\if\@param r\begin{tabular}{r r}\printtabtoks\end{tabular}\hspace{-6pt}\fi
					}
				\fi
			\fi}%
			\vskip 1.5em
			{\usekomafont{date}{\@date \par}}%
			\vskip \z@ \@plus3fill
			{\if\@prof\@empty\else\usekomafont{author}{Professor(in)/Lehrbeauftragte(r): \@prof}\fi}
			%{\usekomafont{publishers}{\@publishers \par}}%
			\vskip 3em
		\if\@param c\end{center}\fi
		\if\@param r\end{flushright}\fi
		\par
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
				}%
			\fi
			\ifx\@lowertitleback\@empty\else
				\ClassWarning{\KOMAClassName}{%
					non empty \string\lowertitleback\space ignored
					by \string\maketitle\MessageBreak
					in `twoside=false' mode%
				}%
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
	\setcounter{footnote}{0}%
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
}%
