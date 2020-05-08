\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pbpreprint}
\LoadClassWithOptions{memoir}

\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage[linecolor=magenta, bordercolor=magenta,
                backgroundcolor=magenta, textwidth=4cm]{todonotes}
\RequirePackage{tikz}
\RequirePackage{letltxmacro}
\RequirePackage{ebgaramond}
%\RequirePackage[cmintegrals,cmbraces]{newtxmath}
%\RequirePackage{ebgaramond-maths}
\RequirePackage{hyperref}

\renewcommand{\@todonotes@drawMarginNoteWithLine}{%
    \begin{tikzpicture}[remember picture, overlay, baseline=-0.75ex]%
        \node [coordinate] (inText) {};%
    \end{tikzpicture}%
    \marginpar[{% Draw note in left margin
        \@todonotes@drawMarginNote{r}%
        \@todonotes@drawLineToLeftMargin%
    }]{% Draw note in right margin
        \@todonotes@drawMarginNote{l}%
        \@todonotes@drawLineToRightMargin%
    }%
    }
    \renewcommand{\@todonotes@drawMarginNote}[1]{
        \makebox[\marginparwidth][#1]{\begin{tikzpicture}[remember picture,baseline=(X.base)]%
            \node(X){\vphantom{X}};%
            \draw node[notestyle,font=\@todonotes@sizecommand,anchor=north] (inNote) at (X.north)%
                {\@todonotes@text};%
            \if@todonotes@authorgiven%
                \draw node[notestyle,font=\@todonotes@sizecommand,anchor=north] (inNote) at (X.north)%
                    {\@todonotes@sizecommand\@todonotes@author};%
                \node(Y)[below=of X]{};%
                \draw node[notestyle,font=\@todonotes@sizecommand,anchor=north] (inNote) at (X.south)%
                    {\@todonotes@text};%
            \else%
                \draw node[notestyle,font=\@todonotes@sizecommand,anchor=north] (inNote) at (X.north)%
                    {\@todonotes@text};%
            \fi%
        \end{tikzpicture}%
    }}

\LetLtxMacro{\oldtodo}{\todo}
\renewcommand{\todo}[1]{{\color{magenta}\oldtodo[fancyline]{\small\color{white}\texttt{TODO:}\textsf{#1}}}}
\newcommand{\note}[1]{{\color{magenta}\oldtodo[fancyline]{\small\color{white}\textsf{#1}}}}

\setsecheadstyle{\LARGE}
\setsubsecheadstyle{\large}
\setsubsubsecheadstyle{\itshape}
\setparaheadstyle{\normalsize\scshape\liningnums}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\captionnamefont{\textsf\small}
\captiontitlefont{\textsf\small}

\renewcommand{\thefootnote}{\color{red}\arabic{footnote}}

\urlstyle{sf}
\let\UrlSpecialsOld\UrlSpecials
\def\UrlSpecials{\UrlSpecialsOld\do\/{\Url@slash}\do\_{\Url@underscore}}%
\def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.2em}%
    {\kern-.0em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
    \def\Url@underscore{\nfss@text{\leavevmode \kern.06em\vbox{\hrule\@width.3em}}}

\definecolor{uured}{RGB}{153,0,0}
