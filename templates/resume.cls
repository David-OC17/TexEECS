%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Resume Template                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2025/01/01 Resume]

% ------------------------------
% Base class and page options
% ------------------------------
\LoadClass[a4paper,11pt]{article}

% ------------------------------
% Required packages
% ------------------------------
\RequirePackage{verbatim}      % verbatim environments
\RequirePackage{titlesec}      % custom section titles
\RequirePackage{color}         % foreground/background color
\RequirePackage{enumitem}      % control over lists
\RequirePackage{fancyhdr}      % headers/footers
\RequirePackage{tabularx}      % extended tabular with flexible width
\RequirePackage{latexsym}      % mathematical symbols
\RequirePackage{marvosym}      % Martin Vogel symbols
\RequirePackage[empty]{fullpage} % 1-inch margins, no headers/footers
\RequirePackage[hidelinks]{hyperref} % clean hyperlinks
\RequirePackage[normalem]{ulem} % underlines (\ul)
\RequirePackage[english]{babel}  % language-specific typographic rules

% ------------------------------
% PDF / Unicode support
% ------------------------------
\input glyphtounicode
\pdfgentounicode=1

% ------------------------------
% Fonts
% ------------------------------
\RequirePackage[default]{sourcesanspro} % Source Sans Pro
\urlstyle{same} % URLs match main font

% ------------------------------
% Page layout
% ------------------------------
\pagestyle{fancy}
\fancyhf{} % clear header/footer
\renewcommand{\headrulewidth}{0in}
\renewcommand{\footrulewidth}{0in}

\setlength{\tabcolsep}{0in} % table column separation

\addtolength{\oddsidemargin}{-0.5in}
\addtolength{\topmargin}{-0.7in}
\addtolength{\textwidth}{1.0in}
\addtolength{\textheight}{1.0in}

\raggedbottom
\raggedright

% ------------------------------
% Section formatting
% ------------------------------
\titleformat{\section}
  {\scshape\large}{} % small caps, large font
  {0em}{}             % label spacing
  [\color{black}\titlerule\vspace{0pt}] % after-code

% ------------------------------
% Redefinitions
% ------------------------------
\renewcommand\labelitemii{$\vcenter{\hbox{\tiny$\bullet$}}$}
\renewcommand{\ULdepth}{2pt}

% ------------------------------
% Custom commands
% ------------------------------

% Resume item
\newcommand{\resumeItem}[1]{\item\small{#1}}

% Start/end item list for resume items
\newcommand{\resumeItemListStart}{\begin{itemize}[rightmargin=0.11in]}
\newcommand{\resumeItemListEnd}{\end{itemize}}

% Section type: label and description
\newcommand{\resumeSectionType}[3]{%
  \item
  \begin{tabular*}{0.96\textwidth}[t]{p{0.15\linewidth}p{0.02\linewidth}p{0.81\linewidth}}
    \textbf{#1} & #2 & #3
  \end{tabular*}\vspace{-2pt}%
}

% Three-column heading
\newcommand{\resumeTrioHeading}[3]{%
  \item\small{
    \begin{tabular*}{0.96\textwidth}[t]{l@{\extracolsep{\fill}}c@{\extracolsep{\fill}}r}
      \textbf{#1} & \textit{#2} & #3
    \end{tabular*}
  }%
}

% Four-element heading
\newcommand{\resumeQuadHeading}[4]{%
  \item
  \begin{tabular*}{0.96\textwidth}[t]{l@{\extracolsep{\fill}}r}
    \textbf{#1} & #2 \\
    \textit{\small#3} & \textit{\small #4} \\
  \end{tabular*}%
}

% Child for four-element heading
\newcommand{\resumeQuadHeadingChild}[2]{%
  \item
  \begin{tabular*}{0.96\textwidth}[t]{l@{\extracolsep{\fill}}r}
    \textbf{\small#1} & {\small#2} \\
  \end{tabular*}%
}

% Start/end itemization for quad headings
\newcommand{\resumeHeadingListStart}{\begin{itemize}[leftmargin=0.15in, label={}]}
\newcommand{\resumeHeadingListEnd}{\end{itemize}}
