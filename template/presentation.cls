%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        Presentation Template                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{presentation}[2025/01/01 presentation]

% Load beamer as the base class
\LoadClass[notheorems,aspectratio=54]{beamer}

\usepackage{latexsym}
\usepackage{amsmath,amssymb}
\usepackage{mathtools}
\usepackage{color,xcolor}
\usepackage{graphicx}
\usepackage{algorithm}
\usepackage{amsthm}
\usepackage{animate} % insert gif
\usepackage{lipsum} % To generate test text 
\usepackage{ulem} % 下划线，波浪线
\usepackage{listings} % display code on slides; don't forget [fragile] option after \begin{frame}

% ----------------------------------------------
% tikz
\usepackage{framed}
\usepackage{tikz}
\usepackage{pgf}
\usetikzlibrary{calc,trees,positioning,arrows,chains,shapes.geometric,%
  decorations.pathreplacing,decorations.pathmorphing,shapes,%
  matrix,shapes.symbols}
\pgfmathsetseed{1} % To have predictable results
\pgfdeclarelayer{background}
\pgfsetlayers{background,main}

\tikzset{
  normal border/.style={orange!30!black!10, decorate,
      decoration={random steps, segment length=2.5cm, amplitude=.7mm}},
  torn border/.style={orange!30!black!5, decorate,
      decoration={random steps, segment length=.5cm, amplitude=1.7mm}}}

\def\parchmentframe#1{%
  \tikz{
    \node[inner sep=2em] (A) {#1};
    \begin{pgfonlayer}{background}
      \fill[normal border] (A.south east) -- (A.south west) --
      (A.north west) -- (A.north east) -- cycle;
    \end{pgfonlayer}}}

\def\parchmentframetop#1{%
  \tikz{
    \node[inner sep=2em] (A) {#1};
    \begin{pgfonlayer}{background}
      \fill[normal border] (A.south east) -- (A.south west) --
      (A.north west) -- (A.north east) -- cycle;
      \fill[torn border] ($(A.south east)-(0,.2)$) -- ($(A.south west)-(0,.2)$) --
      ($(A.south west)+(0,.2)$) -- ($(A.south east)+(0,.2)$) -- cycle;
    \end{pgfonlayer}}}

\def\parchmentframebottom#1{%
  \tikz{
    \node[inner sep=2em] (A) {#1};
    \begin{pgfonlayer}{background}
      \fill[normal border] (A.south east) -- (A.south west) --
      (A.north west) -- (A.north east) -- cycle;
      \fill[torn border] ($(A.north east)-(0,.2)$) -- ($(A.north west)-(0,.2)$) --
      ($(A.north west)+(0,.2)$) -- ($(A.north east)+(0,.2)$) -- cycle;
    \end{pgfonlayer}}}

\def\parchmentframemiddle#1{%
  \tikz{
    \node[inner sep=2em] (A) {#1};
    \begin{pgfonlayer}{background}
      \fill[normal border] (A.south east) -- (A.south west) --
      (A.north west) -- (A.north east) -- cycle;
      \fill[torn border] ($(A.south east)-(0,.2)$) -- ($(A.south west)-(0,.2)$) --
      ($(A.south west)+(0,.2)$) -- ($(A.south east)+(0,.2)$) -- cycle;
      \fill[torn border] ($(A.north east)-(0,.2)$) -- ($(A.north west)-(0,.2)$) --
      ($(A.north west)+(0,.2)$) -- ($(A.north east)+(0,.2)$) -- cycle;
    \end{pgfonlayer}}}

\newenvironment{parchment}[1][Example]{%
  \def\FrameCommand{\parchmentframe}%
  \def\FirstFrameCommand{\parchmentframetop}%
  \def\LastFrameCommand{\parchmentframebottom}%
  \def\MidFrameCommand{\parchmentframemiddle}%
  \vskip\baselineskip
  \MakeFramed {\FrameRestore}
  \noindent\tikz\node[inner sep=1ex, draw=black!20,fill=white,
    anchor=west, overlay] at (0em, 2em) {\sffamily#1};\par}%
{\endMakeFramed}

% Presentation mode settings
\mode<presentation>{
  \usetheme{CambridgeUS}
  \usecolortheme{beaver}
  \useoutertheme{infolines}
  \useinnertheme{circles}
}

% Block color
\setbeamercolor{block title}{bg=red!30,fg=white}

\newcommand{\reditem}[1]{\setbeamercolor{item}{fg=red}\item #1}
\newcommand*{\Scale}[2][4]{\scalebox{#1}{\ensuremath{#2}}}
\renewcommand\textbullet{\ensuremath{\bullet}}

% Flow chart tikz styles
\tikzset{
  >=stealth',
  punktchain/.style={rectangle, rounded corners, draw=white, very thick, text width=6em, minimum height=2em, text centered, on chain},
  largepunktchain/.style={rectangle, rounded corners, draw=white, very thick, text width=10em, minimum height=2em, on chain},
  line/.style={draw, thick, <-},
  element/.style={tape, top color=white, bottom color=blue!50!black!60!, minimum width=6em, draw=blue!40!black!90, very thick, text width=6em, minimum height=2em, text centered, on chain},
  every join/.style={->, thick,shorten >=1pt},
  decoration={brace},
  tuborg/.style={decorate},
  tubnode/.style={midway, right=2pt},
  font={\fontsize{10pt}{12}\selectfont},
}

% Listings (code) settings
\lstset{
  language=C++,
  basicstyle=\ttfamily\footnotesize,
  keywordstyle=\color{red},
  breaklines=true,
  xleftmargin=2em,
  numbers=left,
  numberstyle=\color[RGB]{222,155,81},
  frame=leftline,
  tabsize=4,
  breakatwhitespace=false,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  morekeywords={Str, Num, List},
}
