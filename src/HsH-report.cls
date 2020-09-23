\typeout{Adapted from KOMA script for use in Hochschule Hannover <2020-08-21> Jan Wille}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{HsH-report}[2020/09/21 HsH Report based on KOMA]

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[a4paper,left=3cm,right=2.5cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{babel}

\DeclareOption{ngerman}{%
    \PassOptionsToPackage{\CurrentOption}{babel}
}
\DeclareOption{english}{%
    \PassOptionsToPackage{\CurrentOption}{babel}
}
\ExecuteOptions{ngerman}
\ProcessOptions

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax
\LoadClass[bibliography=totoc,listof=totoc]{scrreprt}


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