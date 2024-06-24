% Inspired by Michael Pollind's Awesome CV
% Created by Murat Can Karacabey
% Modified by Andres Zepeda Perez

%% Metadata and Requirements
\author{Murat Can Karacabey \and Andres Zepeda Perez}
\RequirePackage[dvipsnames]{xcolor}
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{res_format}[2024/06/24 Muratcan-Zepeda CV Class]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage{fontawesome} % for the link icons \faicon https://fontawesome.com/icons
\RequirePackage{mfirstuc} % Capitalization stuff
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\RequirePackage{xparse}
\RequirePackage{xstring}
\RequirePackage{fmtcount}
\RequirePackage{expl3}
\pagestyle{empty}

%% File Constants
% TODO: have a this be chosen per-file rather than the entire class
\RequirePackage[left=0.5in,top=0.4in,right=0.6in,bottom=0.1in]{geometry} % Document margins

\hypersetup{
    colorlinks=true,
    urlcolor=cyan,
} % hyperlinks

%% Other Requirements
% \input{experience.tex}

%%% TODO : Remove and split coverletter stuff?
%% Setup for coverletter
\newcommand*{\setcompanyname}[1]{\def\@companyname{#1}}
\newcommand*{\setcontactperson}[1]{\def\@contactperson{#1}}
\newcommand*{\setcompanyposition}[1]{\def\@companyposition{#1}}
\newcommand*{\setcompanyaddress}[1]{\def\@companyaddress{#1}}

\newcommand{\companynameview}{{\@companyname}}
\newcommand{\companypositionview}{{\@companyposition}}

%% Coverletterview
\newcommand\coverletter[1]{ 
\\  \coverlettersubview 
\section{} \vspace{1ex} 
\textbf{ Hello \@contactperson, \\[0.1cm]}
  #1 \\\\
  Best,\\
  \@firstname  \@lastname
}
\newcommand\coverlettersubview{
\begin{tabular}{>{\scshape \bfseries \color{\@themecolor}}l  >{\small }l}
Company: & \@companyname \\
Position: & \@position \\
Address: & \@companyaddress \\
\end{tabular}
}

\NewDocumentCommand{\showcoverparagraph}{m}{
    \csname #1coverparagraph\endcsname{}
}

\NewDocumentCommand{\createcoverparagraph}{m m}{
    \expandafter\NewDocumentCommand\csname #1coverparagraph\endcsname{}{\unexpanded{#2}}
}

\newcommand{\coverletterheader}{
    \headerview \vspace{1ex}\\
    \coverlettersubview \\
    \section{} \vspace{1ex} \\
    
    \indent{\textbf{ Hello \@contactperson, \\[0.1cm]}}
}

\newcommand{\coverletterfooter}{
    \\\\
    Best,\\
    \namecoverletter
}


%% Profilpicture
\newsavebox{\picbox}
\newcommand{\profpic}[2]{%
    \savebox{\picbox}{%
    \includegraphics[scale=#1]{#2}}% 
    \tikz\node [draw, circle,%
    line width=4pt, color=white,% 
    minimum width=\wd\picbox,minimum height=\ht\picbox,%
    path picture={ \node at (path picture bounding box.center)% 
    {\usebox{\picbox}};}]% 
    {};}


%% Header: Information Gathering

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setdescription}[1]{\def\@description{#1}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setresidence}[1]{\def\@residence{#1}}
\newcommand*{\setresidencePlus}[1]{\def\@residencePlus{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmailp}[1]{\def\@p_mail{#1}}
\newcommand*{\setmails}[1]{\def\@s_mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setlinkedinaccount}[2]{\def\@linkedinaccount{#1}\def\@linkedindisplay{#2}}
\newcommand*{\setgithubaccount}[2]{\def\@githubaccount{#1}\def\@githubdisplay{#2}}
\newcommand*{\setwebsite}[2]{\def\@website{#1}\def\@websitedisplay{#2}}
\newcommand*{\setresearchaccount}[2]{\def\@researchaccount{#1}\def\@researchdisplay{#2}}


%% Header: Visualization 

\newcommand\headerview{ % You might need to mess with the numbers here
\begin{minipage}{0.55\linewidth} % Name and Desc on Left
    \name\\[0.25cm]
    \rightline{\@description}
\end{minipage} 
\hfill
\begin{minipage}{0.35\linewidth} % Contact Info on Right
    \contact 
\end{minipage}
\\[0.15cm]
}

    
%% Header: Contact Info

% Find more at https://mirrors.ibiblio.org/CTAN/fonts/fontawesome5/doc/fontawesome5.pdf
\newcommand{\githubview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize \@githubdisplay}}
\newcommand{\linkedinview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize\@linkedindisplay}}
\newcommand{\websiteview}{\href{\@website}{
\faLaptopCode\ \@websitedisplay}}
\newcommand{\researchview}{\href{\@researchaccount}{
\small\faGraduationCap\ \@researchdisplay}}


\newcommand{\name}{%
    {\Huge \textsc{\@firstname} \ \textsc{\textbf{\@lastname}}}
}
\newcommand{\namecoverletter}{%
    {\@firstname\   \@lastname}
}

% \newcommand{\contact}{%
%         {\rightline{\@address  \cps \@mobile} \\ 
%         \rightline{\@p_mail} \\ 
%         \rightline{\@s_mail} \\
%         \rightline{\linkedinview \cps \githubview} \\ 
%         } % 
% }

\newcommand{\contact}{%
        {\rightline{\@residence\cps \@residencePlus} \\ 
        \rightline{\@p_mail} \\
        \rightline{\@mobile\cps \researchview} \\
        \rightline{\linkedinview\cps \githubview} \\ 
        } % 
}

%% Miscellaneous Helper Commands

% Colorful-Pipe-Seperator
\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}
% Colorful bulletpoints
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}


%% Section Styles
\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

\titleformat{\section} 
    % Make the \section headers large (\Large), small capitals (\scshape) and left aligned (\raggedright)
  {\large\bfseries\scshape\raggedright\color{\@themecolor}}
  {}{0em} % Use the first {} to insert a prefix to all sections
  {\ruleafter}   % Can be used to insert code before the heading

\titlespacing*{\section}{-1pt}{-5pt}{0pt} % {left}{pre}{post} spacing


%% Text View

% Date Formatting
\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black!60!\@themecolor} #1 } 
}

% Dated Experience {ExperienceName}{Information}{Date}
\newcommand{\datedexperience}[3]{%
  \begin{small} \mbox { \hspace{1em} \scshape \textbf{#1} } \end{small} \begin{footnotesize} \textit{\positiontext{#2}}\end{footnotesize} \hfill \datetext{#3}\\[0.01cm] %
}

% Bulletpoints {Information}{Include an indent (optional)}{Remove the bulletpoint dot (optional)}
% kept in one thing instead of separate indented explanation for simplicity in block automation
\NewDocumentCommand{\explanation}{m O{} O{}}{%
    %\rmshape for normal \scshape for small caps
    \mbox { \rmshape \hspace{1.2em} \footnotesize \ifthenelse{\equal{#2}{}}{}{~~~~~~}\ifthenelse{\equal{#3}{}}{\coloredbullet }{} #1}\\[0.05cm] 
}


%% Skills Block

% The Table
\newcommand{\skillblock}[1]{%
    \indent \begin{minipage}{0.96\linewidth} \footnotesize #1 \end{minipage} \\[0.1cm]
}

% Skillset Title and List
\newcommand\createskill[2]{%
    \textsc{\textbf{#1}} & #2
}

% Insert skills in a commented list to display formatted block
\newcommand\createskills[1]{%
    \skillblock{
      \begin{tabular}{rl}
        \makeatletter
        \@for\thisitem:=#1\do{\thisitem\\[0.1cm]}
        \makeatother
        \end{tabular}
    }
}

% Helper to show the bullet points in the given order
\NewDocumentCommand{\showexplanations}{m m}{%
    \begingroup
    \edef\explanations{\unexpanded\expandafter{\csname #1explanationlist\endcsname}}%
    \explanations % I have no idea why this line is necessary, I typed it while debugging and suddenly everything works
    % Counter is: {\csname the#1counter\endcsname}
    \foreach \j in {#2}{
        \foreach \i in {1,2,...,\csname the#1counter\endcsname}{
            \ifthenelse{\i>\csname the#1counter\endcsname}{}{
                \IfStrEq{\i}{\j}{
                    \expandafter\expandafter\expandafter\@firstoftwo\expandafter{\expandafter{\csname #1explanation\i\endcsname}}
                }{}
            } 
        }
    }
    \endgroup
}

% Experience block maker
\NewDocumentCommand{\createexperienceblock}{m m m}{
    \expandafter\NewDocumentCommand\csname #1experienceblock\endcsname{m}{
        \newcounter{#1counter}
        \expandafter\newcommand\csname #1explanationlist\endcsname{
            \foreach \x [count=\xi] in {#3} {
                \expandafter\expandafter\expandafter\xdef\expandafter\csname #1explanation\xi\endcsname{
                    \unexpanded\x%
                }
                \stepcounter{#1counter}
            }
        }
        #2
        \showexplanations{#1}{##1}
    }
}

% Experience block visualizer
\NewDocumentCommand{\showexperienceblock}{m m}{
    \csname #1experienceblock\endcsname{#2}
}


%% Unsused Items
\newcommand{\itemwithtext}[1]{%
    \begin{minipage}{\linewidth} \footnotesize \item #1 \end{minipage}
}

\newcommand\createbullets[1]{%
    \renewcommand{\labelitemi}{\coloredbullet}
  \begin{itemize}
    \makeatletter
    \@for\thisitem:=#1\do{\itemwithtext{\thisitem}}
    \makeatother
  \end{itemize}
}

\newcommand{\addblocktext}[2]{%
  \section{#1} 
  \indent \skillblock{\hspace{4ex} #2}
}

\newcommand\createtablecontent[1]{%
    \foreach \x [count=\xi] in {#1} {\ifthenelse{\xi=1}{\x}{\\ \x}}
}

\NewDocumentCommand{\getelement}{m m}{%
    % First: #1 
    % Second: \unexpanded{#2} 
    \StrCount{#1,}{,}[\len] 
    % Items: \len  
    \foreach \i in {1,...,\len}{%
        \ifthenelse{\i=1}{%
            \StrBefore[\i]{#1}{,}[\val]%
        }{
            \StrBetween[\i,\i+1]{,#1,}{,}{,}[\val]%
        }% 
        \ifthenelse{\i=#2}{%
            \num
        }{}%  
    }%
}

%% WhiteSpace Text

% This is for information that didn't make the cut into the actual resume, but where not having it may lead to not being accepted by ATS
% Unsure if this is even picked up by ATS and some HR depts say they look negatively on anyone using whitespace, so use at own risk
\newcommand\createinvisiblelines[3]{
    \usepackage{background}
    \backgroundsetup{
      scale=1,
      color=blue,
      % opacity=0.1,
      angle=0,
      position=current page.south,
      vshift=0.5cm,
      contents={
        \parbox{\textwidth}{
          \centering
          \fontsize{5pt}{5pt}\selectfont 
          \textcolor{black!02}{ % opacity is the number here
            #1\\
            #2\\
            #3 % 3 lines was chosen arbitrarily
          }
        }
      }
    }
}

%%%%%%%%%%%%%% EXPERIMENTS

%%%%%%%%%%%%%%%%%%%%


%% Invisible
\newcommand\includeinvisiblelines{
    \createinvisiblelines{
        Additional Skills: Research, Search Algorithm, Prompt Engineering, Unity, Game Development, VR, 5G, Teaching, Technical Writing, Creative Writing, Data Visualization. 5 Years in Python and Java, 2 in C\# and R
        }{
        Interests: Research, Algorithm Design and Analysis, Proofs, Technical Documentation, Game Theory, Decision Theory, Complexity Theory. I have a knack for teaching new topics, and finding out how to mix algorithms
        }{
        Comments: I am a very qualified candidate with varied, yet specialized skills, with over 2 years worth of experience in highly technical areas such as Research, ML, DataScience, and Technical communication
        }
}



