\typeout{Adapted from KOMA script for use in Hochschule Hannover <2020-01-22> Jan Wille}
\NeedsTeXFormat{LaTeX2e}

\newcommand{\myClassName}{HsH-standalone}
\ProvidesClass{\myClassName}[2020/03/13 HsH Report based on KOMA]

\newcommand{\HsHlogoPath}{HSH-Logo.pdf}
\newcommand{\HsHlogoPage}{1}
\newcommand{\includeHsHlogohere}{\includegraphics[width=5cm,page=\HsHlogoPage]{\HsHlogoPath}}


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
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}

\ExecuteOptions{fontsize=11pt,a4paper,ngerman,sans} % standart options
\ProcessOptions\relax

\LoadClass[margin=0.25cm,multi=tikzpicture,multi=circuitikz]{standalone}


\newcommand*{\@titlehead}{}%
\newcommand{\titlehead}[1]{\gdef\@titlehead{#1}}%
\newcommand*{\@subject}{}%
\newcommand*{\subject}[1]{\gdef\@subject{#1}}%
\newcommand*{\@subtitle}{}%
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}%
\newcommand*{\@publishers}{}%
\newcommand{\publishers}[1]{\gdef\@publishers{#1}}%
\InputIfFileExists{personal.tex}{
	\ClassInfo{\myClassName}{personal.tex was found. Using it...}
}{
	\ClassInfo{\myClassName}{no personal.tex! Configre the titlepage yourself}
}

% enforced options for packages
\PassOptionsToPackage{utf8}{inputenc}
\PassOptionsToPackage{T1}{fontenc}
\PassOptionsToPackage{babel, german=quotes}{csquotes}
\PassOptionsToPackage{free-standing-units}{siunitx}
\PassOptionsToPackage{european,EFvoltages,straightvoltages}{circuitikz}

% used packages:
\RequirePackage{inputenc} % inputencoding, utf8 recomendet
\RequirePackage{fontenc} % outputencoding, T1 recomendet
\RequirePackage{lmodern} % font
\RequirePackage{graphicx} % required for importing images
\RequirePackage{babel} % required for german names
\RequirePackage{amsmath} % a lot of nice Math
\if@german\RequirePackage{ziffer}\fi % german dezimal numbers

% typesetting indexes upright or standart
\def\subinrm#1{\sb{\mathrm{#1}}}
{\catcode`\_=13 \global\let_=\subinrm}
\mathcode`_="8000
\newcommand\upsubscripts{\catcode`\_=12 } % the toggle for upright subscripts
\newcommand\normalsubscripts{\catcode`\_=8 } % the toggle for italic subscripts
\upsubscripts % setting upright as default

% keep compatible
\providecommand{\renewcaptionname}[3]{}

% custom commands
\providecommand{\abs}[1]{\ensuremath{\left\vert#1\right\vert}} % Makro for vertical lines around absolute values

% load config at beginning of document
\AtBeginDocument{
	\makeatletter
	\@ifpackageloaded{subfigure}{
		\newcommand{\subfigureautorefname}{\figureautorefname}
	}{}%
	\InputIfFileExists{config.tex}{
		\ClassInfo{\myClassName}{config.tex was found. Using it...}
	}{
		\ClassInfo{\myClassName}{no config.tex!! I hope you configured it yourself.}
	}
	\makeatother
}
