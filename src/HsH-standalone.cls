%%
%% This is file `HsH-standalone.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% HsH-classes.dtx  (with options: `standalone')
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
\typeout{Adapted from KOMA script for use in Hochschule Hannover <2023-08-12> Jan Wille}
\NeedsTeXFormat{LaTeX2e}
\newcommand{\HsHClassName}{HsH-standalone}
\ProvidesClass{\HsHClassName}[2023/08/12 v2.1 HsH-Class based on KOMA]

%% commands for HsH-logo
\newcommand{\HsHlogoPath}{HSH-Logo.pdf}
\newcommand{\HsHlogoPage}{1}
\newcommand{\includeHsHlogohere}[1][5cm]{
  \IfFileExists{\HsHlogoPath}{}{
    \ClassError{\HsHClassName}{HsH-Logo.pdf not found!}{
      The HsH Logo is necasary for the titlepage! Try putting it next to your source file or use \HsHlogoPath to define the file location
    }
  }
  \includegraphics[width=#1,page=\HsHlogoPage]{\HsHlogoPath}
}
\newif\if@german%

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
%% defere all other options to the base class
\DeclareOption*{\expandafter\PassOptionsToClass\expandafter{\CurrentOption}{standalone}}
\ExecuteOptions{margin=0.25cm,fontsize=11pt,a4paper,ngerman,sans} % default options
\ProcessOptions\relax
%% Load KOMA class
\LoadClass[multi=tikzpicture,multi=circuitikz]{standalone}

%% package loading and config ---------------------------------------------------------------------
\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}
\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
%% options for not loaded packages ----------------------------------------------------------------
\PassOptionsToPackage{free-standing-units}{siunitx}
\PassOptionsToPackage{european,EFvoltages,straightvoltages,betterproportions}{circuitikz}

%% typesetting indexes upright or standart
\def\subinrm#1{\sb{\mathrm{#1}}}
{\catcode`\_=13 \global\let_=\subinrm}
\newcommand\upsubscripts{\catcode`\_=12 }
\newcommand\normalsubscripts{\catcode`\_=8 }
\upsubscripts

%% load config at beginning of document
\AtBeginDocument{
  \makeatletter
  \InputIfFileExists{HsH-classes.cfg}{
    \ClassInfo{\HsHClassName}{HsH-classes.cfg was found. Using it...}
  }{
    \ClassInfo{\HsHClassName}{no HsH-classes.cfg!! I hope you configered it yourself.}
  }
  %% provide some usefull commands:
  \providecommand{\abs}[1]{\ensuremath{\left\vert#1\right\vert}}
  \makeatother
}
\endinput
%%
%% End of file `HsH-standalone.cls'.
