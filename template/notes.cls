%===============================================================================
%                               My Notes Class
%===============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2025/01/01 notes ]

\LoadClass{article}

\RequirePackage{cbasics}
\RequirePackage{cmath}

%===============================================================================
%                                Basic Packages
%===============================================================================
\RequirePackage[usenames,dvipsnames,pdftex]{xcolor}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{multicol}
\RequirePackage{amsmath,amsfonts,mathtools,amsthm,amssymb}
\RequirePackage{cancel}
\RequirePackage{caption}
\RequirePackage{pdfpages}
\RequirePackage[ruled,vlined,linesnumbered]{algorithm2e}
\RequirePackage{tikzsymbols}

%===============================================================================
%                                Basic Settings
%===============================================================================
\let\implies\Rightarrow
\let\impliedby\Leftarrow
\let\iff\Leftrightarrow
\let\epsilon\varepsilon

\setlength{\tabcolsep}{5pt}
\renewcommand\arraystretch{1.5}

\RequirePackage{siunitx}
\sisetup{locale = FR}

\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{tikz}
\RequirePackage{tikz-cd}
\usetikzlibrary{intersections, angles, quotes, calc, positioning, arrows.meta}

\tikzset{
  force/.style={thick, {Circle[length=2pt]}-stealth, shorten <=-1pt}
}

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.13}

\RequirePackage{titling}
\renewcommand\maketitlehooka{\null\mbox{}\vfill}
\renewcommand\maketitlehookd{\vfill\null}

\RequirePackage{eso-pic}
\RequirePackage{ifthen}
\newcommand\definegraybackground{
  \definecolor{reallylightgray}{HTML}{FAFAFA}
  \AddToShipoutPicture{
    \ifthenelse{\isodd{\thepage}}{
      \AtPageLowerLeft{
        \put(\LenToUnit{\dimexpr\paperwidth-222pt},0){
          \color{reallylightgray}\rule{222pt}{297mm}
        }
      }
    }{
      \AtPageLowerLeft{
        \color{reallylightgray}\rule{222pt}{297mm}
      }
    }
  }
}

\hypersetup{
  colorlinks,
  linkcolor=blue,
  citecolor={black},
  urlcolor={blue!80!black}
}

\newcommand{\wrapfill}{\par\ifnum\value{WF@wrappedlines}>0
    \parskip=0pt
    \addtocounter{WF@wrappedlines}{-1}%
    \null\vspace{\arabic{WF@wrappedlines}\baselineskip}%
    \WFclear
\fi}

\let\multicolmulticols\multicols
\let\endmulticolmulticols\endmulticols

\RenewDocumentEnvironment{multicols}{mO{}}
{%
  \ifnum#1=1
    #2%
  \else
    \multicolmulticols{#1}[#2]
  \fi
}
{%
  \ifnum#1=1
\else
  \endmulticolmulticols
\fi
}

\newlength{\thickarrayrulewidth}
\setlength{\thickarrayrulewidth}{5\arrayrulewidth}

%===============================================================================
%                           School Specific Commands
%===============================================================================
\newcounter{lecturecounter}
\makeatletter

\newcommand\resetcounters{
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \setcounter{paragraph}{0}
  \setcounter{subparagraph}{0}
  \setcounter{theorem}{0}
  \setcounter{claim}{0}
  \setcounter{corollary}{0}
  \setcounter{lemma}{0}
  \setcounter{exercise}{0}
}

\RequirePackage{xifthen}

\def\@lesson{}
\newcommand\lesson[3][\arabic{lecturecounter}]{
  \addtocounter{lecturecounter}{1}
  \setcounter{section}{#1}
  \renewcommand\thesubsection{#1.\arabic{subsection}}
  \resetcounters
  \ifthenelse{\isempty{#3}}{
    \def\@lesson{Lecture \arabic{lecturecounter}}
  }{
    \def\@lesson{Lecture \arabic{lecturecounter}: #3}
  }
  \hfill\small{#2}
  \hrule
  \vspace*{-0.3cm}
  \section*{\@lesson}
  \addcontentsline{toc}{section}{\@lesson}
}

\RequirePackage{import}
\pdfminorversion=7

\newcommand\incfig[2][1]{%
  \def\svgwidth{#1\columnwidth}
  \import{./figures/}{#2.pdf_tex}
}

\begingroup\expandafter\expandafter\expandafter\endgroup
\expandafter\ifx\csname pdfsuppresswarningpagegroup\endcsname\relax
\else
  \pdfsuppresswarningpagegroup=1\relax
\fi

\RequirePackage{fancyhdr}
\newcommand\forcenewpage{\clearpage\mbox{~}\clearpage\newpage}

\newcommand\createintro{
  \pagenumbering{roman}
  \maketitle
  \thispagestyle{empty}
  \newpage
  \IfFileExists{intro.tex}{
    \input{intro}
    \pagestyle{fancy}
    \renewcommand\headrulewidth{0pt}
    \fancyhead{}
    \fancyfoot[C]{
      \textit{For more notes like this, visit
      \href{\linktootherpages}{\shortlinkname}}. \\
      \vspace{0.1cm}
      \hrule
      \vspace{0.1cm}
      \@author, \\
      \term: \academicyear, \\
      Last Update: \@date, \\
      \faculty
    }
  }{
    \forcenewpage
  }
  \newpage
  \fancyfoot[C]{\thepage}
  \tableofcontents
  \forcenewpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \renewcommand\headrulewidth{0.4pt}
  \fancyhead[R]{\@lesson}
  \fancyhead[L]{\@author}
  \fancyfoot[C]{\thepage}
}

\makeatother

%===============================================================================
%                               Custom Commands
%===============================================================================
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
  \node[shape=circle,draw,inner sep=1pt] (char) {#1};}
}

\RequirePackage{xargs}
\RequirePackage[colorinlistoftodos]{todonotes}

\makeatletter
\newcommandx\unsure[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx\change[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx\info[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx\improvement[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommand\listnotes{\newpage\listoftodos[Notes]}
\makeatother

\definecolor{correct}{HTML}{009900}
\newcommand\correct[2]{{\color{red}{#1 }}\ensuremath{\to}{\color{correct}{ #2}}}

%===============================================================================
%                                 Environments
%===============================================================================
\RequirePackage{varwidth}
\RequirePackage{thmtools}
\RequirePackage[most,many,breakable]{tcolorbox}
\tcbuselibrary{theorems,skins,hooks}
\usetikzlibrary{arrows,calc,shadows.blur}

\definecolor{myblue}{RGB}{45, 111, 177}
\definecolor{mygreen}{RGB}{56, 140, 70}
\definecolor{myred}{RGB}{199, 68, 64}
\definecolor{mypurple}{RGB}{197, 92, 212}

\colorlet{definition}{mygreen!85!black}
\colorlet{claim}{mygreen!85!black}
\colorlet{corollary}{mypurple!85!black}
\colorlet{proof}{myblue}

\mdfsetup{skipabove=1em,skipbelow=0em}

\newcommand\createnewcoloredtheoremstyle[4]{
  \declaretheoremstyle[
  headfont=\bfseries\sffamily\color{#2}, bodyfont=\normalfont, #3,
  mdframed={
    linewidth=2pt,
    rightline=false, leftline=true, topline=false, bottomline=false,
    linecolor=#2, backgroundcolor=#2!5, #4,
  },
  ]{#1}
}

\createnewcoloredtheoremstyle{thmtheorembox}{theorem}{}{}
\createnewcoloredtheoremstyle{thmdefinitionbox}{definition}{}{}
\createnewcoloredtheoremstyle{thmclaimbox}{claim}{}{}
\createnewcoloredtheoremstyle{thmcorollarybox}{corollary}{}{}
\createnewcoloredtheoremstyle{thmpropbox}{myblue}{}{}
\createnewcoloredtheoremstyle{thmlemmabox}{myred}{}{}
\createnewcoloredtheoremstyle{thmexercisebox}{mygreen}{}{}
\createnewcoloredtheoremstyle{thmproofbox}{proof}{qed=\qedsymbol}{backgroundcolor=white}

\declaretheorem[numberwithin=section, style=thmtheorembox, name=Theorem]{theorem}
\declaretheorem[numbered=no, style=thmdefinitionbox, name=Definition]{definition}
\declaretheorem[numberwithin=section, style=thmclaimbox, name=Claim]{claim}
\declaretheorem[numberwithin=section, style=thmcorollarybox, name=Corollary]{corollary}
\declaretheorem[numberwithin=section, style=thmpropbox, name=Proposition]{prop}
\declaretheorem[numberwithin=section, style=thmlemmabox, name=Lemma]{lemma}
\declaretheorem[numberwithin=section, style=thmexercisebox, name=Exercise]{exercise}
\declaretheorem[numbered=no, style=thmproofbox, name=Proof]{replacementproof}

\renewenvironment{proof}[1][\proofname]{\vspace{-10pt}\begin{replacementproof}}{\end{replacementproof}}

\endinput
