\typeout{Adapted from KOMA script for use in Hochschule Hannover <2020-08-21> Jan Wille}
\NeedsTeXFormat{LaTeX2e}

\newcommand{\myClassName}{HsH-report}
\ProvidesClass{\myClassName}[2020/09/21 HsH Report based on KOMA]
\LoadClass[bibliography=totoc,listof=totoc]{scrreprt}

\newcommand{\HsHlogoPath}{HSH-Logo.pdf}
\newcommand{\HsHlogoPage}{1}
\newcommand{\includeHsHlogohere}{\includegraphics[width=5cm,page=\HsHlogoPage]{\HsHlogoPath}}
\providecommand{\abs}[1]{\ensuremath{\left\vert#1\right\vert}} % Makro für Betragsstriche

\newif\if@german%

\DeclareOption{ngerman}{%
	\PassOptionsToPackage{\CurrentOption}{babel}
	\renewcaptionname{ngerman}{\figurename}{Abb.} %Figure
	\renewcaptionname{ngerman}{\tablename}{Tab.} %Table
	\@germantrue
}
\DeclareOption{english}{%
	\PassOptionsToPackage{\CurrentOption}{babel}
	\renewcaptionname{english}{\figurename}{Fig.} %Figure
	\renewcaptionname{english}{\tablename}{Tab.} %Table
}
\DeclareOption{f1}{%
	\renewcommand{\HsHlogoPage}{2}
}
\DeclareOption{f2}{%
	\renewcommand{\HsHlogoPage}{3}
}
\DeclareOption{f3}{%
	\renewcommand{\HsHlogoPage}{4}
}
\DeclareOption{f4}{%
	\renewcommand{\HsHlogoPage}{5}
}
\DeclareOption{f5}{%
	\renewcommand{\HsHlogoPage}{6}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}

\@ifclasswith{\myClassName}{english}{}{\@ifclasswith{\myClassName}{ngerman}{}{\ExecuteOptions{ngerman}}}
\ProcessOptions\relax

\InputIfFileExists{personal.tex}{
	\ClassInfo{\myClassName}{personal.tex was found. Using it...}
}{
	\ClassInfo{\myClassName}{no personal.tex! Configre the titlepage yourselfe}
}

% recomendet options for packages
\PassOptionsToPackage{utf8}{inputenc}
\PassOptionsToPackage{T1}{fontenc}
\PassOptionsToPackage{left=3cm,right=2.5cm,top=3cm,bottom=3cm}{geometry}
\PassOptionsToPackage{babel, german=quotes}{csquotes}
\PassOptionsToPackage{headsepline}{scrlayer-scrpage}
\PassOptionsToPackage{free-standing-units}{siunitx}
\PassOptionsToPackage{european,EFvoltages,straightvoltages}{circuitikz}

%used packages:
\RequirePackage{inputenc} % inputencoding, utf8 recomendet
\RequirePackage{fontenc} % outputencoding, T1 recomendet
\RequirePackage{lmodern} % font
\RequirePackage{geometry} % required for changing layout
\RequirePackage{graphicx} % required for importing images
\RequirePackage{babel} % required for german names
\RequirePackage{scrlayer-scrpage} % required for header and footer
\RequirePackage{scrhack} % compatability with listings
\RequirePackage{pgffor} % foreach loops
\if@german\RequirePackage{ziffer}\fi % german dezimal numbers

% should these be in?
\RequirePackage{subfigure}
\RequirePackage{pdfpages}
\RequirePackage{hyperref}
\RequirePackage{bookmark}
\RequirePackage{csquotes}

 % config for header and footer
\pagestyle{scrheadings}
\clearpairofpagestyles
\renewcommand{\chapterpagestyle}{scrheadings} % Kapitelanfang standart Kopf/Fußzeile
\automark{section}
\ohead{\headmark}
\ihead{\@title}
\ofoot*{\pagemark}

% typesetting indexes upright or standart
\def\subinrm#1{\sb{\textnormal{#1}}}
{\catcode`\_=13 \global\let_=\subinrm}
\mathcode`_="8000
\newcommand\upsubscripts{\catcode`\_=12 } % the toggle for upright subscripts
\newcommand\normalsubscripts{\catcode`\_=8 } % the toggle for italic subscripts
\upsubscripts % setting upright as default

% do stuff
\setlength\parindent{0pt} % indentation of new paragraphs
\raggedbottom
\renewcommand{\fps@figure}{h!t} % positioning of figures
\renewcommand{\fps@table}{h!t} % Positonierung of tables

\newcommand\declarationAuthorship{
	\thispagestyle{plain}
	\vspace*{\fill}
	{\rule{\textwidth}{0.1pt}}
	\vspace{0.5cm}

	\renewcommand{\thanks}{\empty}
	\newcommand{\tempA}{ich}
	\newcommand{\tempB}{}
	\foreach \x [count=\i] in \@author{
		\ifnum\i>1
			\gdef\tempA{wir}
			\gdef\tempB{n}
		\else\fi
	}
	\begin{center}
		\huge \textbf{Versicherung}\\
		\Large über selbstständiges Erarbeiten dieses  Berichtes\\
	\end{center}
	\vspace{1cm}\normalsize
	Hiermit bestätige\tempB\space\tempA, dass \tempA\space die folgende Arbeit unter Berücksichtigung der zur Verfügung
	gestellten Aufgabenstellung sowie dem Arbeitsmaterial unter Angabe aller verwendeten Quellen
	selbstständig erarbeitet habe\tempB.\\
	\begin{flushright}
		\foreach \x [count=\i] in \@author{
			\vspace{1cm}
			\begin{tabular}[t]{r}
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

\AtBeginDocument {
	\makeatletter
	\InputIfFileExists{config.tex}{
		\ClassInfo{\myClassName}{config.tex was found. Using it...}
	}{
		\ClassInfo{\myClassName}{no config.tex!! I hope you configered it yourself.}
	}
	\makeatother
}

\renewcommand\maketitle[1][1]{%
	\expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
	\else
		\def\and{%
			\end{tabular}%
			\hskip 1em \@plus.17fil%
			\begin{tabular}[t]{c}%
		}%
	\fi
	\if@titlepage
		\begin{titlepage}
			\setcounter{page}{%
				#1%
			}%
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
			% Customised: -----------------------------------------------------------
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
				\raisebox{0pt}[\ht\strutbox][\dp\strutbox]{\includeHsHlogohere}
			\end{minipage}
			\raisebox{10pt}{\rule{\textwidth}{0.5pt}}
			% end Customised: --------------------------------------------------------
			\null\vfill
			\begin{center}
				\ifx\@subject\@empty \else
					{\usekomafont{subject}{\@subject\par}}%
					\vskip 3em
				\fi
				{\usekomafont{title}{\huge \@title\par}}%
				\vskip 1em
				{\ifx\@subtitle\@empty\else\usekomafont{subtitle}{\@subtitle\par}\fi}%
				\vskip 2em
				{%
					\usekomafont{author}{%
						\lineskip 0.75em
						\begin{tabular}[t]{c}
							\parbox{\linewidth}{\centering\@author}
						\end{tabular}\par
					}%
				}%
				\vskip 1.5em
				{\usekomafont{date}{\@date \par}}%
				\vskip \z@ \@plus3fill
				{\usekomafont{publishers}{\@publishers \par}}%
				\vskip 3em
			\end{center}\par
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
	\else
		\par
		\@tempcnta=%
		#1%
		\relax\ifnum\@tempcnta=1\else
			\ClassWarning{\KOMAClassName}{%
				Optional argument of \string\maketitle\space ignored\MessageBreak
				in `titlepage=false' mode%
			}%
		\fi
		\ifx\@uppertitleback\@empty\else
			\ClassWarning{\KOMAClassName}{%
				non empty \string\uppertitleback\space ignored
				by \string\maketitle\MessageBreak
				in `titlepage=false' mode%
			}%
		\fi
		\ifx\@lowertitleback\@empty\else
			\ClassWarning{\KOMAClassName}{%
				non empty \string\lowertitleback\space ignored
				by \string\maketitle\MessageBreak
				in `titlepage=false' mode%
			}%
		\fi
		\begingroup
			\let\titlepage@restore\relax
			\renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
			\let\@oldmakefnmark\@makefnmark
			\renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
			\next@tdpage
			\if@twocolumn
				\ifnum \col@number=\@ne
					\ifx\@extratitle\@empty
						\ifx\@frontispiece\@empty\else\if@twoside\mbox{}\fi\fi
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
					\@maketitle
				\else
					\ifx\@extratitle\@empty
						\ifx\@frontispiece\@empty\else\if@twoside\mbox{}\fi\fi
					\else
						\twocolumn[\@makeextratitle]%
					\fi
					\ifx\@frontispiece\@empty
						\ifx\@extratitle\@empty\else\next@tdpage\fi
					\else
						\next@tpage
						\twocolumn[\@makefrontispiece]%
						\next@tdpage
					\fi
					\twocolumn[\@maketitle]%
				\fi
			\else
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
				\@maketitle
			\fi
			\ifx\titlepagestyle\@empty\else\thispagestyle{\titlepagestyle}\fi
			\@thanks\global\let\@thanks\@empty
		\endgroup
	\fi
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
	\fi
	\global\let\and\relax
}%

\renewcommand*{\@maketitle}{%
	\global\@topnum=\z@
	\setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
	% Customised: -----------------------------------------------------------
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
		\raisebox{0pt}[\ht\strutbox][\dp\strutbox]{\includeHsHlogohere}
	\end{minipage}
	\raisebox{10pt}{\rule{\textwidth}{0.5pt}}
	% end Customised: --------------------------------------------------------
	\null
	\vskip 2em%
	\begin{center}%
		\ifx\@subject\@empty \else
		{\usekomafont{subject}{\@subject \par}}%
		\vskip 1.5em
		\fi
		{\usekomafont{title}{\huge \@title \par}}%
		\vskip .5em
		{\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
		\vskip 1em
		{%
		\usekomafont{author}{%
			\lineskip .5em%
			\begin{tabular}[t]{c}
			\@author
			\end{tabular}\par
		}%
		}%
		\vskip 1em%
		{\usekomafont{date}{\@date \par}}%
		\vskip \z@ \@plus 1em
		{\usekomafont{publishers}{\@publishers \par}}%
		\ifx\@dedication\@empty \else
		\vskip 2em
		{\usekomafont{dedication}{\@dedication \par}}%
		\fi
	\end{center}%
	\par
	\vskip 2em
}%