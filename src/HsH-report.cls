\typeout{Adapted from KOMA script for use in Hochschule Hannover <2020-08-21> Jan Wille}
\NeedsTeXFormat{LaTeX2e}

\newcommand{\myClassName}{HsH-report}
\ProvidesClass{\myClassName}[2020/09/21 HsH Report based on KOMA]

\LoadClass[bibliography=totoc,listof=totoc]{scrreprt}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{bookmark}

\PassOptionsToPackage{left=3cm,right=2.5cm,top=3cm,bottom=3cm}{geometry}

\DeclareOption{ngerman}{%
	\PassOptionsToPackage{\CurrentOption}{babel}
	\PassOptionsToPackage{figurename=Abb.,tablename=Tab.}{caption}
}
\DeclareOption{english}{%
	\PassOptionsToPackage{\CurrentOption}{babel}
	\PassOptionsToPackage{figurename=fig.,tablename=tab.}{caption}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}

\ExecuteOptions{ngerman}
\ProcessOptions\relax

\RequirePackage{babel}
\RequirePackage{geometry}
\RequirePackage{caption}

\RequirePackage[headsepline]{scrlayer-scrpage} % kopf und Fußzeilen, linie oben (footsepline für unten)
\pagestyle{scrheadings}
\clearpairofpagestyles
\renewcommand{\chapterpagestyle}{scrheadings} % Kapitelanfang standart Kopf/Fußzeile
\automark{chapter}

\ohead{\headmark}
\ihead{\@title}
\ofoot{\pagemark}

% typesetting indexes upright by default
\def\subinrm#1{\sb{\textnormal{#1}}}
{\catcode`\_=13 \global\let_=\subinrm}
\mathcode`_="8000
\newcommand\upsubscripts{\catcode`\_=12 }% the toggle for upright subscripts
\newcommand\normalsubscripts{\catcode`\_=8 }% the toggle for italic subscripts
\upsubscripts

\PassOptionsToPackage{free-standing-units}{siunitx}
\setlength\parindent{0pt}
\renewcommand{\fps@figure}{h!t} % positioning of figures
\renewcommand{\fps@table}{h!t} % Positonierung of tables


\renewcommand\maketitle{
	\newpage
	\null
	\thispagestyle{empty}
	\vspace{-1.5cm}

	\hfill\includegraphics[width=6cm]{img/HSH-Logo-Fak1}
	\rule{\textwidth}{0.5pt}

	\begin{center}
		\Large
		\vspace*{\fill}
		{\Huge\textbf{\@title}}\\
		\vspace{1cm}
		von \@author\\

		\vfill
		\vspace{10cm}
		\@date
	\end{center}
	\clearpage
}

\newcommand\declarationAuthorship{
	\pagebreak
	\vspace*{\fill}
	{\rule{\textwidth}{0.1pt}}
	\vspace{0.5cm}
	\begin{center}
		\huge \textbf{Versicherung}\\
		\Large über selbstständiges Erarbeiten dieses  Berichtes\\
	\end{center}
	\vspace{1cm}\normalsize
	Hiermit bestätige ich, dass ich die folgenden Arbeit unter Berücksichtigung der zur Verfügung
	gestellten Aufgabenstellung sowie dem Arbeitsmaterial unter Angabe aller verwendeten Quel-len
	selbstständig erarbeitet habe.\\
	\vspace{1cm}
	\begin{flushright}
		\rule{5cm}{0.4pt} \\
		{\footnotesize\makeatletter\@author}
	\end{flushright}
	\newpage
}


\renewenvironment{abstract}{%
	\renewcommand\abstractname{Abstract}

	%\addchap*{\centering\abstractname}
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