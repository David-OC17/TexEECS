%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Report Template                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{report}[2025/01/01 report]
\RequirePackage{include/reportinclude}

%----------------------------------------------------------
% Article class requirements
%----------------------------------------------------------

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass[twocolumn]{extarticle}

%----------------------------------------------------------
% Graphics path and lengths
%----------------------------------------------------------

\setlist{noitemsep}
\setlength{\columnsep}{15pt}

%----------------------------------------------------------
% Header and footer 
%----------------------------------------------------------

\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}

\pagestyle{fancy}

\pagenumbering{Roman}

\fancypagestyle{firststyle}{
   \fancyfoot[R]{\footerfont\@institution \hspace{10pt} \textbf{\@date} \hspace{10pt} \@ftitle \hspace{10pt} \textbf{\thepage\textendash\pageref{LastPage}}}
   \fancyfoot[L]{\footerfont\@ifundefined{@course}{}{\@course}}
   \fancyhead[C]{}
   \fancyhead[R]{}
   \fancyhead[L]{}
}

% Header
\fancyhead[C]{}
\fancyhead[RE]{\footerfont\sffamily\itshape\@title}
\fancyhead[RO]{}
\fancyhead[LO]{\footerfont\sffamily\itshape\@title}
\fancyhead[LE]{}

% Footer
\lfoot{}%
\cfoot{}%
\rfoot{}%

\fancyfoot[LE]{\footerfont\textbf{\thepage} \hspace{10pt} \@ifundefined{@course}{}{\@course}}
\fancyfoot[RO]{\footerfont\@institution \hspace{10pt} \textbf{\@date} \hspace{10pt} \@ftitle \hspace{10pt} \textbf{\thepage}}
\fancyfoot[RE,LO]{\footerfont\@ifundefined{@etal}{}{\itshape\@etal}\ifnum \value{authors} > 1\hspace{5pt}\textit{}\fi}

\renewcommand{\headrulewidth}{0pt} % No header rule
\renewcommand{\footrulewidth}{0pt} % No footer rule

%----------------------------------------------------------
% Tau start (lettrine)
%----------------------------------------------------------

\newcommand{\dropcapfont}{\color{taublue}\bfseries\fontsize{26pt}{28pt}\selectfont}
\newcommand{\taustart}[1]{\lettrine[lines=2,lraise=0,findent=2pt, nindent=0em]{{\dropcapfont{#1}}}{}}

%----------------------------------------------------------
% Abstract preferences
%----------------------------------------------------------

\newcommand{\absfont}{\selectfont\small\color{taublue}\sffamily\bfseries}      % Abstract font
\newcommand{\abstextfont}{\selectfont\small\itshape}                           % Abstract text font
\newcommand{\keywordsfont}{\selectfont\small\color{taublue}\sffamily\bfseries} % Keyword font
\newcommand{\keywordsfonttext}{\selectfont\small\itshape}											 % Keyword font text

\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract 
	\long\gdef\theabstract{\ignorespaces#1}
	\def\go{\end{abstract}}
\else
	#1\end{#2}
	\gdef\theabstract{\vskip12pt
	\vskip12pt}
	\let\go\relax\fi
\go}

\newcommand{\abscontent}{
	\noindent
	\parbox{\dimexpr\linewidth}{%
		\vskip3pt%
		\hspace*{1em}{\absfont\abstractname---}\abstextfont\theabstract
	}%
	\vskip10pt%
	\noindent
	\parbox{\dimexpr\linewidth}{%
		{
			\@ifundefined{@keywords}{}{\hspace*{1em}{\keywordsfont keywords---}}\ignorespaces{\keywordsfonttext\@keywords}
		}
	}%
	\vskip12pt%
}

%----------------------------------------------------------
% Title preferences
%----------------------------------------------------------

\setlength{\droptitle}{-25\baselineskip} % Move the title up

\renewcommand{\@maketitle}{%
        \vskip-24pt
    {\centering\bfseries\color{taublue}\fontsize{16}{22}\sffamily\selectfont\@title\par}
		\vskip8pt
    {\centering\normalsize\sffamily\@author\par}
        \vskip8pt
    {\centering\fontsize{7pt}{8pt}\selectfont\@professor\par}
        \vskip24pt
}%

%----------------------------------------------------------
% Affil setup
%----------------------------------------------------------

\usepackage{authblk} % For custom environment affiliation

\newcommand{\andlanguage}{
    \iflanguage{spanish}{
        { y }%
    }{%
        { and }%
    }%
}

\setlength{\affilsep}{8pt}
\renewcommand\Authfont{\normalfont\sffamily\bfseries\fontsize{9}{11}}
\renewcommand\Affilfont{\normalfont\itshape\fontsize{7.5}{9}}
% \renewcommand\AB@affilsepx{; \protect\Affilfont}
\renewcommand\Authands{, }
\renewcommand\Authand{\ignorespaces\andlanguage}

%----------------------------------------------------------
% Section formating
%----------------------------------------------------------

\setcounter{secnumdepth}{5}

\titleformat{\section}
  	{\color{taublue}\sffamily\large\bfseries}
  	{\thesection.}
  	{0.5em}
  	{#1}
  	[]
  
\titleformat{name=\section,numberless}
  	{\color{taublue}\sffamily\large\bfseries}
  	{}
  	{0em}
  	{#1}
  	[]  
  
\titleformat{\subsection}[block] % You may change it to "runin"
  	{\bfseries\sffamily}
  	{\thesubsection.}
  	{0.5em}
  	{#1}      % If using runin, change #1 to '#1. ' (space at the end)
  	[]
  
\titleformat{\subsubsection}[block] % You may change it to "runin"
  	{\small\bfseries\sffamily\itshape}
  	{\thesubsubsection.}
  	{0.5em}
  	{#1}      % If using runin, change #1 to '#1. ' (space at the end)
  	[]    
  
\titleformat{\paragraph}[runin]
	{\small\bfseries}
  	{}
  	{0em}
  	{#1} 
  
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}

%----------------------------------------------------------
% Table of contents
%----------------------------------------------------------

\newlength{\tocsep} 
\setlength\tocsep{1.5pc} % Sets the indentation of the sections in the table of contents
\setcounter{tocdepth}{5} % Three levels in the table of contents section: sections, subsections and subsubsections

\usepackage{titletoc}
\contentsmargin{0cm}

\titlecontents{section}[\tocsep]
	{\addvspace{4pt}\sffamily\selectfont\bfseries}
	{\contentslabel[\thecontentslabel]{\tocsep}}
	{}
	{\hfill\thecontentspage}
	[]

\titlecontents{subsection}[3pc]
	{\addvspace{4pt}\small\sffamily\selectfont}
	{\contentslabel[\thecontentslabel]{\tocsep}}
	{}
	{\ \titlerule*[.5pc]{.}\ \thecontentspage}
	[]

\titlecontents*{subsubsection}[3pc]
	{\footnotesize\sffamily\itshape\selectfont}
	{}
	{}
	{}
	[\ \textbullet\ ]

%----------------------------------------------------------
% Figures caption style
%----------------------------------------------------------

\captionsetup[figure]{format=plain, labelsep=period, textfont={small}, justification=centering, labelfont={small,bf,sf}}

%----------------------------------------------------------
% Table caption style
%----------------------------------------------------------

\captionsetup*[table]{labelfont={small,bf,sf},textfont={small},skip=10pt,position=below,labelsep=period} % Change it to "above" if you prefer the caption above the table.
\newcommand{\addtabletext}[1]{{\setlength{\leftskip}{9pt}\fontsize{7}{9}\vskip2pt\selectfont#1}}

%----------------------------------------------------------
% Listings caption style (codes)
%----------------------------------------------------------

\captionsetup[lstlisting]{font=small, labelfont={bf,sf}, belowskip=3pt, position=below, textfont=small, labelsep=period}
\renewcommand\lstlistingname{Code}
\renewcommand\lstlistlistingname{Code}

%----------------------------------------------------------
% Footnotes
%----------------------------------------------------------

\definecolor{black50}{gray}{0.5}
\renewcommand*{\footnotelayout}{\normalfont\fontsize{6}{8}}
\renewcommand{\footnoterule}{
 	\kern -3pt
  	{\color{black50} \hrule width 72pt height 0.25pt}
  	\kern 2.5pt
}

%----------------------------------------------------------
% URL settings
%----------------------------------------------------------

\RequirePackage{url}
\RequirePackage{xurl}
\renewcommand\UrlFont{\selectfont}
\RequirePackage[colorlinks=true, allcolors=taublue]{hyperref}

%----------------------------------------------------------
% BiblaTeX
%----------------------------------------------------------

\usepackage[
    backend=biber,
    style=ieee,
    sorting=ynt
]{biblatex}

\addbibresource{@bibfile.bib}

%----------------------------------------------------------

\endinput