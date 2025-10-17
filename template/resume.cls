%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Resume Template                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2025/01/01 resume]

\RequirePackage{reportinclude}

% ------------------------------
% Base class and page options
% ------------------------------
\LoadClass[a4paper,11pt]{article}

% ------------------------------
% Required packages
% ------------------------------
\RequirePackage{verbatim}             % verbatim environments
\RequirePackage{titlesec}             % custom section titles
\RequirePackage{color}                % foreground/background color
\RequirePackage{fancyhdr}             % headers/footers
\RequirePackage{latexsym}             % mathematical symbols
\RequirePackage{marvosym}             % Martin Vogel symbols
\RequirePackage[empty]{fullpage}      % 1-inch margins, no headers/footers
\RequirePackage[normalem]{ulem}       % underlines (\ul)
\RequirePackage[english]{babel}       % language-specific typographic rules
\RequirePackage[default]{sourcesanspro} % Source Sans Pro

% ------------------------------
% Unicode and visual
% ------------------------------
\input glyphtounicode
\pdfgentounicode=1

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
