\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{cinnabargreen}{HTML}{61B329}
\definecolor{grass}{HTML}{4DBD33}
\definecolor{richorange}{HTML}{FF681F}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\ifdefined\@cv@print
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\subfont[]{Helvetica Neue Medium}
\newfontfamily\thinfont[]{Helvetica Neue UltraLight}
\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% \newfontfamily\bodyfont[]{Lato}
% \newfontfamily\thinfont[]{Lato Hairline}
% \newfontfamily\headingfont[]{Lato Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Lato Light}

% \setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      grass%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {
    \subfont\large\color{lightgray} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\RequirePackage{longtable}
\setlength\LTleft{0pt}
\setlength\LTright{0pt}
\setlength\LTpre{6pt}
\setlength\LTpost{3pt}
\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist}{%
  \begin{longtable}{@{\extracolsep{\fill}}ll}
}{%
  \end{longtable}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.6cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    \raggedright#4\vspace{\parsep}%
  }\\}


\newenvironment{entrylist2}{%
  \begin{longtable}{@{\extracolsep{\fill}}ll}
}{%
  \end{longtable}
}
\newcommand{\entrytwo}[2]{%
  #1&\parbox[t]{12.8cm}{%
    \raggedright#2\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

% \RequirePackage[backend=biber, style=verbose, maxnames=99, sorting=ydnt]{biblatex}

% \DeclareFieldFormat[article]{title}{#1\par}
% \DeclareFieldFormat[inproceedings]{title}{#1\par}
% \DeclareFieldFormat[misc]{title}{#1\par}
% \DeclareFieldFormat[report]{title}{#1\par}

% \DeclareBibliographyDriver{article}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \usebibmacro{journal+issuetitle}%
%     \setunit{\space}%
%     \printfield{pages}%
%     \newunit%
%     \printlist{publisher}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{inproceedings}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}%
%     \printfield{booktitle}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{misc}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{booktitle}%
%     \setunit*{\addcomma\space}%
%     \printfield{note}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{report}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{type}%
%     \setunit{\space}%
%     \printfield{number}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareNameFormat{author}{%
%   \small\addfontfeature{Color=lightgray}%
%   \ifblank{#3}{}{#3\space}#1%
%   \ifthenelse{\value{listcount}<\value{liststop}}
%     {\addcomma\space}
%     {}%
% }

% \newcommand{\printbibsection}[2]{
%   \begin{refsection}
%     \nocite{*}
%     \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
%   \end{refsection}
% }

% \DeclareSortingScheme{chronological}{
%   \sort[direction=descending]{\field{year}}
%   \sort[direction=descending]{\field{month}}
% }



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks, pdfpagemode = UseOutlines]{hyperref}