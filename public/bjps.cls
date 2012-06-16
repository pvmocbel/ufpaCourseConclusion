%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX class file for Brazilian Journal of Probability and Statistics

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjps}
               [2007/10/25 v0.01 BJPS Article Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions

\LoadClass{amsart}

% make logo same size as normal text
\def\@logofont{\fontsize{10}{12}\selectfont}

\def\publname{Brazilian Journal of Probability and Statistics}

\def\ISSN{0103-0752}

% define PII to be same for all articles
\PII{ISSN \ISSN}

% \copyrightinfo can be overridden in the prologue of an article file
\copyrightinfo{\currentyear}%    % copyright year
   {Brazilian Statistical Association}% copyright holder

\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

