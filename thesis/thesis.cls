%%
%% Further modified by James Barnes
%%
%% Modified by Ricardo Garcia-Rosas to satisfy the rules established by the University of Melbourne's Research Higher Degrees Committee as of 4th of June 2019.
%% Guidelines can be found at: https://gradresearch.unimelb.edu.au/__data/assets/pdf_file/0004/2027839/Preparation-of-GR-theses-rules.pdf
%%
%% Original header:
%%
%% This is file `Thesis.cls', based on 'ECSthesis.cls', by Steve R. Gunn
%% generated with the docstrip utility.
%%
%% Created by Steve R. Gunn, modified by Sunil Patel: www.sunilpatel.co.uk

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{thesis}[2007/22/02 v1.0 LaTeX document class]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}

\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}
\usepackage{setspace}
\onehalfspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\usepackage{vmargin}
\setmarginsrb           { 1.5in}  % left margin
                        { 0.6in}  % top margin
                        { 1.0in}  % right margin
                        { 0.8in}  % bottom margin
                        {  20pt}  % head height
                        {0.25in}  % head sep
                        {   9pt}  % foot height
                        { 0.3in}  % foot sep
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.
\usepackage{fancyhdr}
\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}}
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{
  \btypeout{\thechapter\space #1}
  \markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}
}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{
  \clearpage
  \if@twoside 
    \ifodd
      \c@page
    \else
      \hbox{}
      \thispagestyle{empty}
      \newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi
  \phantomsection
}

\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{axiom}[theorem]{Axiom}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}

\usepackage[centerlast,small,sc]{caption}
\usepackage{subcaption}
\setlength{\captionmargin}{20pt}
\newcommand{\ie}{\emph{i.e.}\xspace}
\newcommand{\eg}{\emph{e.g.}\xspace}
\newcommand{\Ie}{\emph{I.e.}\xspace}
\newcommand{\Eg}{\emph{E.g.}\xspace}
\newcommand{\etc}{\emph{etc}}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}

\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{multirow}
\usepackage{longtable}
\usepackage{rotating}
\usepackage{listings}
\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks,linkcolor={blue},citecolor={blue},urlcolor={red},
   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
\hypersetup{urlcolor=blue, colorlinks=true}
\pdfstringdefDisableCommands{
   \let\\\space
}

\usepackage[en-AU]{datetime2}
\DTMlangsetup[en-AU]{showdayofmonth=false}

\newcommand*{\supervisor}[1]{\def\supname{#1}}
\newcommand*{\examiner}[1]{\def\examname{#1}}
\newcommand*{\degree}[1]{\def\degreename{#1}}
\newcommand*{\shortauthors}[1]{\def\shortauthornames{#1}}
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\addresses}[1]{\def\addressnames{#1}}
\newcommand*{\university}[1]{\def\univname{#1}}
\newcommand*{\UNIVERSITY}[1]{\def\UNIVNAME{#1}}
\newcommand*{\school}[1]{\def\schoolname{#1}}
\newcommand*{\SCHOOL}[1]{\def\SCHOOLNAME{#1}}
\newcommand*{\group}[1]{\def\groupname{#1}}
\newcommand*{\GROUP}[1]{\def\GROUPNAME{#1}}
\newcommand*{\department}[1]{\def\deptname{#1}}
\newcommand*{\DEPARTMENT}[1]{\def\DEPTNAME{#1}}
\newcommand*{\subject}[1]{\def\subjectname{#1}}
\newcommand*{\keywords}[1]{\def\keywordnames{#1}}
\newcommand*{\wordcount}[1]{\expandafter\def\expandafter\totalwordcount{#1}}
\supervisor  {}
\examiner    {}
\degree      {}
\shortauthors{}
\authors     {}
\university  {}
\UNIVERSITY  {}
\school      {}
\SCHOOL      {}
\group       {}
\GROUP       {}
\department  {}
\DEPARTMENT  {}
\addresses   {}
\subject     {}
\keywords    {}
\wordcount   {0}
\renewcommand\maketitle{
  \btypeout{Title Page}
  \hypersetup{pdftitle={\@title}}
  \hypersetup{pdfsubject=\subjectname}
  \hypersetup{pdfauthor=\authornames}
  \hypersetup{pdfkeywords=\keywordnames}
  \thispagestyle{empty}
  \begin{titlepage}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
    \setcounter{footnote}{0}
    \null\vfil
    \vskip 0\p@
    \begin{center}
      \setlength{\parskip}{0pt}
      %
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      % Comment \includegraphics line out!!
      %
      % {\includegraphics[width=0.3\textwidth]{figures/unimelb_logo.eps} \par}
      %
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      %
      \vfill
      {\huge \bf \@title \par}
      \vfill
      {\LARGE by \par}
      \smallskip
      {\LARGE \authornames \par}
      \bigskip
      \bigskip
      {\large Supervised by \supname \par}
      \vfill
      {\large A research thesis submitted in fulfillment for the \par}
      {\large degree of \degreename \par}
      \bigskip
      \bigskip
      {\large in the \par}
      {\large \deptname \par}
      {\large \schoolname \par}
      {\large \textbf{\UNIVNAME}  \par}
      \bigskip
      \bigskip
      \bigskip
      \bigskip
      {\Large \@date \par}
      \bigskip
    \end{center}
    \par
    \@thanks
    \vfil\null
  \end{titlepage}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  % \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \cleardoublepage
}
\newcommand\Declaration[2]{
  \btypeout{Declaration of Authorship}
  \addtotoc{Declaration of Authorship}
  \addtocontents{toc}{\vspace{1em}}
  \thispagestyle{plain}
  \null\vfil
  %\vskip 60\p@
  \begin{center}
    {\huge\bf Declaration of Authorship\par}
  \end{center}
  %\vskip 60\p@
  {\normalsize #1}
  \vfil\vfil
  {\ooalign{Signed:\cr\hspace{4em}}{#2}\\
  \rule[1em]{.67\textwidth}{0.5pt}

  \ooalign{Date:\cr\hspace{4em}} \@date \\
  \rule[1em]{.67\textwidth}{0.5pt}}
  \cleardoublepage
}

\newcommand\Preface[1]{
  \btypeout{Preface}
  \addtotoc{Preface}
  \addtocontents{toc}{\vspace{1em}}
  \thispagestyle{plain}
  \null\vfil
  %\vskip 60\p@
  \begin{center}
    {\huge\bf Preface\par}
  \end{center}
  %\vskip 60\p@
  {\normalsize #1}
  \vfil\vfil\null
  \cleardoublepage
}
\newcommand\abstract[1]{
  \btypeout{Abstract}
  \addtotoc{Abstract}
  \addtocontents{toc}{\vspace{1em}}
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    {\normalsize \UNIVNAME \par}
    \bigskip
    {\huge{\textit{Abstract}} \par}
    \bigskip
    {\normalsize \deptname \par}
    {\normalsize \schoolname \par}
    \bigskip
    {\normalsize \degreename\par}
    \bigskip
    {\normalsize\bf \@title \par}
    \medskip
    {\normalsize by \authornames \par}
    \bigskip
  \end{center}
  {#1}
  \vfil\vfil\vfil\null
  \cleardoublepage
}
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcommand\addtotoc[1]{
  \addcontentsline{toc}{chapter}{#1}
}
\renewcommand\tableofcontents{
  \btypeout{\contentsname}
  \lhead{\emph{\contentsname}}
  \begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{
      \contentsname
      \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
    }
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
  }\end{spacing}
}
\renewcommand\listoffigures{
  \btypeout{\listfigurename}
  \addtotoc{\listfigurename}
  \lhead{\emph{\listfigurename}}
  \begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{
      \listfigurename
      \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}
    }
    \@starttoc{lof}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
  }\end{spacing}
}
\renewcommand\listoftables{
  \btypeout{\listtablename}
  \addtotoc{\listtablename}
  \lhead{\emph{\listtablename}}
  \begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{
      \listtablename
      \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}
    }
    \@starttoc{lot}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
  }\end{spacing}
}
\renewcommand\lstlistlistingname{List of Listings}
\renewcommand\lstlistoflistings{
  \btypeout{\lstlistlistingname}
  \addtotoc{\lstlistlistingname}
  \lhead{\emph{\lstlistlistingname}}
  \begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{
      \lstlistlistingname
      \@mkboth{\MakeUppercase\lstlistlistingname}{\MakeUppercase\lstlistlistingname}
    }
    \@starttoc{lol}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
  }\end{spacing}
}
\let\my@chapter\@chapter
\renewcommand*{\@chapter}{%
  \addtocontents{lol}{\protect\addvspace{10pt}}%
  \my@chapter
}
\newcommand\listsymbolname{Abbreviations}
\newcommand\listofsymbols[2]{
  \btypeout{\listsymbolname}
  \addtotoc{\listsymbolname}
  \chapter*{
    \listsymbolname
    \@mkboth{\MakeUppercase\listsymbolname}{\MakeUppercase\listsymbolname}
  }
  \begin{longtable}[c]{#1}#2\end{longtable}\par
  \cleardoublepage
}
\newcommand\listconstants{Constants}
\newcommand\listofconstants[2]{
  \btypeout{\listconstants}
  \addtotoc{\listconstants}
  \chapter*{
    \listconstants
    \@mkboth{\MakeUppercase\listconstants}{\MakeUppercase\listconstants}
  }
  \begin{longtable}[c]{#1}#2\end{longtable}\par
  \cleardoublepage
}
\newcommand\listnomenclature{Symbols}
\newcommand\listofnomenclature[2]{
  \btypeout{\listnomenclature}
  \addtotoc{\listnomenclature}
  \chapter*{
    \listnomenclature
    \@mkboth{\MakeUppercase\listnomenclature}{\MakeUppercase\listnomenclature}
  }
  \begin{longtable}[c]{#1}#2\end{longtable}\par
  \cleardoublepage
}
\newcommand\acknowledgements[1]{
  \btypeout{Acknowledgements}
  \addtotoc{Acknowledgements}
  \addtocontents{toc}{\vspace{1em}}
  \thispagestyle{plain}
  \begin{center}
    {\huge{\textit{Acknowledgements}} \par}
  \end{center}
  {\normalsize #1}
  \vfil\vfil\null
  \cleardoublepage
}
\newcommand\dedicatory[1]{
  \btypeout{Dedicatory}
  \thispagestyle{plain}
  \null\vfil
  \vskip 60\p@
  \begin{center}{\Large \sl #1}\end{center}
  \vfil\null
  \cleardoublepage
}
\newcommand\quotepage[2]{
  \thispagestyle{empty}
  \null
  \vfill
  \begin{center}
    \begin{varwidth}{\maxdimen}
      \raggedright{\itshape #1}
  
      \vspace{1em}
      \raggedleft{--- #2 \hspace{1em}}
    \end{varwidth}
  \end{center}
  \vfill
  \vfill
  \cleardoublepage
}
\renewcommand\backmatter{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \addtotoc{\bibname}
  \btypeout{\bibname}
  \@mainmatterfalse
}
\endinput
%%
%% End of file `thesis.cls'.
