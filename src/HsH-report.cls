\typeout{Adapted from KOMA script for use in Hochschule Hannover <2020-08-21> Jan Wille}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{HsH-report}[2020/09/21 HsH Report based on KOMA]

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
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


\makeatletter
\renewcommand\maketitle{
    \newpage
    \thispagestyle{empty}
    \begin{center}
        \vspace*{\fill}
            \LARGE{
                Projekt Bericht:\\
                \textbf{\@title}
            }\\
            \vspace{1cm}
            von \@author

        \vfill
    \end{center}
    \vspace{10cm}
    \clearpage
}
\makeatother