\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ericsson2}[2005/07/07 v1.0 (R. F. Zampolo) ]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[12pt,a4paper,onecolumn]{report}

\RequirePackage{graphicx,color,amsmath,cite}


\newcommand{\DH@title}{}
\newcommand{\DH@date}{}
\newcommand{\DH@editor}{}
\newcommand{\DH@author}{}
\newcommand{\DH@number}{}


\newcommand{\DocTitle}[1]{\renewcommand{\DH@title}{\footnotesize{#1}}}
\newcommand{\DocDate}[1]{\renewcommand{\DH@date}{\footnotesize{#1}}}
\newcommand{\DocEditor}[1]{\renewcommand{\DH@editor}{\footnotesize{#1}}}
\newcommand{\DocAuthor}[1]{\renewcommand{\DH@author}{\footnotesize{#1}}}
\newcommand{\DocNumber}[1]{\renewcommand{\DH@number}{\footnotesize{#1}}}

%\@onlypreamble{\DocTitle}
%\@onlypreamble{\DocDate}
%\@onlypreamble{\DocEditor}
%\@onlypreamble{\DocAuthor}
%\@onlypreamble{\DocVersion}

\newcommand{\ps@dochead}{%
   \renewcommand{\@oddhead}{%
      \begin{minipage}{\textwidth}\normalfont\footnotesize
         %\rule{\textwidth}{0.6pt}\vspace{0.5ex}
         \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{0pt}:~}l@{\extracolsep{\fill}}%
        l@{\extracolsep{0pt}:~}l@{}}%
        Editor  &\DH@editor     & Author & \DH@author   \\
        Title   &\DH@title      & Document & \DH@number  \\
        Date    &\DH@date       & Page    & \thepage     \\
     \end{tabular*}
     \vspace{0.5ex}\rule{\textwidth}{0.6pt}%
       \end{minipage}}
   \renewcommand{\@evenhead}{\@oddhead}
   \renewcommand{\@oddfoot}{}
   \renewcommand{\@evenfoot}{}
}
\pagestyle{dochead}

%These instructions grant the top margin:
\setlength{\headheight}{3.5\baselineskip}
\setlength{\headsep}{3em}

\let\DH@chapter=\chapter
\renewcommand{\thepage}{\thechapter-\arabic{page}}
\renewcommand{\chapter}{\newpage\setcounter{page}{1}\DH@chapter}
