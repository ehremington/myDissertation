%% University of Alabama at Birmingham Ph.D. thesis class file.
%% Unofficial, and deviates from standards set forth in the format
%% manual[1] in a number of small ways.  You are free to modify, but
%% you must reflect the changes in the changelog below.  You should
%% also update the \typeout lines and the name of the file.

%% [1] http://www.uab.edu/graduate/theses_dissertation/FormatManual.pdf

%% CHANGELOG
%% 2019/07/14 Original version by Eric Remington (ehreming@uab.edu).


%% NOTES:
%%
%% 1. This class is based upon the standard book class.
%%
%% 2. The choice of auxiliary packages reflects my own taste and what
%% I found to work.  If a different combination of packages suits you
%% better, feel free to make a new version of the class.

%%%% DOCUMENTATION

%% OPTIONS.  The class takes a few options.  For example, most of the
%% options for the book class make sense for this class as well,
%% and will be automatically passed along.  The options which do NOT
%% make sense to pass along are the font size options and the options
%% which dictate which sides of the page are printed upon.  This is
%% because the UAB thesis guidelines stipulate 12pt fonts and
%% one-sided printing with particular margins.
%%
%% On the other hand, several of the options do make sense.  This
%% includes the options "draft", leqno, reqno, and paper size.



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uab-thesis}[2010/06/09 v1.1]
\PassOptionsToClass{12pt, oneside}{book}
\DeclareOption{times}{
  \AtEndOfClass{\RequirePackage{times}}
}
\DeclareOption{phd}{
  \def\degree{Doctor of Philosophy}
  \def\docname{A DISSERTATION}
}
\DeclareOption{ms}{
  \def\degree{Master of Science}
  \def\docname{A THESIS}
}
\DeclareOption{ma}{
  \def\degree{Master of Arts}
  \def\docname{A THESIS}
}

\DeclareOption{normaltitle}{
  \def\submitted{\docname\\\ \\Submitted to the faculty of
    The University of Alabama at Birmingham,\\in partial fulfillment
    of the requirements of the degree of\\\degree}
}

\DeclareOption*{%  for unknown options
  \PassOptionsToClass{\CurrentOption}{book}
}
%\ExecuteOptions{phd,mathtitle}
\ExecuteOptions{phd,normaltitle}
\ProcessOptions\relax
\LoadClass{book}
\RequirePackage{etoolbox}
\RequirePackage[titles]{tocloft}
\tocloftpagestyle{fancy}

\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\patchcmd{\l@chapter}{#1}{\MakeTextUppercase{#1}}{}{}
\renewcommand\cftchapafterpnum{\vspace{10pt}}
\renewcommand\cftchapdotsep{\cftdotsep}
\RequirePackage{titlesec}
\titleformat{\chapter}[display]
{\normalfont\normalsize\centering}{\MakeUppercase{\chaptertitlename}\ \thechapter}{0pt}{\normalsize\MakeUppercase}

\titleformat{\section}
{\normalfont\normalsize\centering}{\thesection}{1em}{}

\titleformat{\subsection}
{\normalfont\normalsize\itshape}{\thesubsection}{1em}{}

\titlespacing{\chapter} {0pt}{.75in}{0pt}
\titlespacing{\section} {0pt}{0pt}{0pt}
\titlespacing{\subsection} {0pt}{0pt}{0pt}

\setlength{\cftbeforetoctitleskip}{0pt}

%% more packages
\RequirePackage{ifthen}
\RequirePackage[overload]{textcase}
\RequirePackage{microtype}
\RequirePackage{amsthm, amssymb, amsmath}
\RequirePackage{fancyhdr}
\PassOptionsToPackage{doublespacing}{setspace}
\RequirePackage{setspace}
\PassOptionsToPackage{left=1.5in,right=1in,top=1in,bottom=1in}{geometry}
\RequirePackage{geometry}

\RequirePackage[backend=biber, url=false, style=numeric,doi=false,isbn=false, sorting=none,giveninits=true]{biblatex}

%% removes the annoying "In:" from bibliography entries
\renewbibmacro{in:}{%
  \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ragged2e}

% help to prevent widows and orphans
%\widowpenalty10000
%\clubpenalty10000

%%%%%%%%%%
%%
%% HEADERS AND FOOTERS
%%
%%%%%%%%%%
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\cfoot{\vfill\small\thepage}


%%%%%%%%%%
%%
%% TABLE OF CONTENTS
%%
%%%%%%%%%%

\setcounter{tocdepth}{3}

%% Define a table of contents page with requisite spacing.
\let\oldcontents\tableofcontents
\renewcommand{\tableofcontents}{\newpage \singlespacing \oldcontents
 \doublespacing}

%% Add the word 'Page' to the table of contents on the right side
\addtocontents{toc}{\medskip\hfill\textit{Page}\par}



%% The following are the correct names for the table of contents, list
%% of figures, list of tables, and list of references.

\renewcommand{\contentsname}{\normalfont TABLE OF CONTENTS}
\renewcommand{\listfigurename}{\normalfont LIST OF FIGURES}
\renewcommand{\listtablename}{\normalfont LIST OF TABLES}

\numberwithin{section}{chapter}
\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}


%% The table of contents must have dotted leaders.  This is the advice
%% from the AMS.  http://www.ams.org/authors/author-faq.html

\renewcommand\@dotsep{1.0}
\renewcommand{\cftdotsep}{1}


%% set linespacing in list of figs and tables
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lot}{\protect\noaddvspace}
\addtocontents{lof}{\protect\noaddvspace}


%% Adding the words 'Table' and 'Page' in the lot and lof
\addtocontents{lot}{\hspace*{-.55in}\textit{Table}\hfill\textit{Page}\hspace*{-.25in}}
\addtocontents{lof}{\hspace*{-.55in}\textit{Figure}\hfill\textit{Page}\hspace*{-.25in}}

%% fix spacing between numbering and caption in list of figures
\renewcommand*\l@table{\@dottedtocline{1}{0em}{2.3em}}
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}

%% put space between page numbers and captions in list of tables and figures
\renewcommand\@tocrmarg{7.7em plus 1fil\nobreak} % versus 2.55em



%%%%%%%%%%
%%
%% FRONT MATTER
%%
%%%%%%%%%%

%% Title page includes title, author, committee, year, and a
%% statement.  New macros are defined for the committee and year.
\newcommand{\thesiscommittee}[1]{\newcommand{\thethesiscommittee}{#1}}
\newcommand{\thesisyear}[1]{\newcommand{\thethesisyear}{#1}}

%% Make the title page
\newcommand{\maketitlepage}{%  renew to new
%  \checktitle  % to make sure all is defined
  \pagenumbering{roman}  % front matter numbered roman
  \thispagestyle{empty}  % but not this page!!!!!
  \begin{center}
    \begin{singlespace}
      \null \vspace{.751in}
      \MakeUppercase{\@title}
      \\[66pt]
      by\\
      \ \\
      \MakeUppercase{\@author}
      \ \\
      \ \\
      \ \\
      \ \\
     \thethesiscommittee
      \vfill
      \submitted\\
      \ \\
      BIRMINGHAM, ALABAMA\\
      \ \\
      \thethesisyear
    \end{singlespace}
  \end{center}
}

%% Make the copyright page (optional)
\newcommand{\copyrightpage}{%
  \newpage
  \null\vfill
  \thispagestyle{empty}
  \begin{center}
    \begin{singlespace}
      Copyright by\\
      \@author\\
      \thethesisyear
    \end{singlespace}
  \end{center}
}
%% Make the dedication page (optional)
\newenvironment{dedication}{%
   \newpage
  \addcontentsline{toc}{chapter}{Dedication}
  \chapter*{Dedication} %\normalfont DEDICATION}
}{}
%% Make the acknowledgments page (optional)
\newenvironment{acknowledgments}{%
  \newpage
  \addcontentsline{toc}{chapter}{Acknowledgments}
  \chapter*{Acknowledgments}
}{}
%% Abstract page (with keywords).  This is an ENVIRONMENT.  Added
%% benefit of emitting a warning if no keywords have been defined.  It
%% takes an argument, which is the field the degree will be awarded in.
\def\keywords#1{\def\@keywords{#1}}
\newenvironment{abstract}[1]{%  renew to new
  \newpage
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \begin{center}
    \MakeUppercase{\@title}

    \MakeUppercase{\@author}

    \MakeUppercase{#1}

    ABSTRACT
  \end{center}\par
}{ \ifthenelse{ \equal{\@keywords}{} }
  {
    \ClassWarningNoLine{\@classname}{No
      keywords defined with \protect\keywords\space macro}
  }{%
    \vfill\par\noindent Keywords: \@keywords
  }
}


%%%%%%%%%%
%%
%% THESIS BODY
%%
%%%%%%%%%%

%% Call this after front matter is finished.
\newcommand{\thesisbody}{%
  \setcounter{page}{0}
  \pagenumbering{arabic}
}

% Unbolds citation markers
% \renewcommand\citeform[1]{{#1}}


\renewcommand{\bibname}{}

% make appendices work with titlesec
\g@addto@macro{\appendix}{%
  \renewcommand\chaptertitlename{Appendix}%

}
