% Created by Murat Can Karacabey
% this is inspired by Michael Pollind's Awesome CV 
% Created from scratch as a much simpler alternative to it to actually learn LaTeX.
% Might be interpreted as an easier-to-edit or easier-to-understand-what-is-going-on version of it.
\author{Murat Can Karacabey}
\RequirePackage[dvipsnames]{xcolor} % moved here I guess article class causes option clash with xcolor if used after loading the class
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muratcan_cv}[2020/04/15 Muratcan CV Class]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[left=0.7in,top=0.3in,right=0.7in,bottom=0.4in]{geometry} % Document margins
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\pagestyle{empty}

%Setup

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setdescription}[1]{\def\@description{#1}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmailp}[1]{\def\@p_mail{#1}}
\newcommand*{\setmails}[1]{\def\@s_mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}

%Setup for coverletter

\newcommand*{\setcompanyname}[1]{\def\@companyname{#1}}
\newcommand*{\setcontactperson}[1]{\def\@contactperson{#1}}
\newcommand*{\setclaimedposition}[1]{\def\@claimedposition{#1}}
\newcommand*{\setcompanyaddress}[1]{\def\@companyaddress{#1}}


\hypersetup{
    colorlinks=true,
    urlcolor=cyan,
}

% View commands
% Header

% can makebox also be used?
\newcommand\headerview{
\begin{minipage}{0.5\linewidth}
    \name\\[0.25cm]
    \rightline{\@description}
\end{minipage}% 
\hfill
\begin{minipage}{0.45\linewidth}
    \contact % address \ mobile \\ mail
\end{minipage}
}

%profilpicture

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
    
%contactsubviews 
    
    
\newcommand{\githubview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize Andres Zepeda}}
\newcommand{\linkedinview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize TheAMIZZguy}}

\newcommand{\name}{%
    {\Huge \textsc{\@firstname} \ \textsc{\@lastname}}
}

\newcommand{\contact}{%
        {\rightline{\@address  \cps \@mobile} \\ 
        \rightline{\@p_mail} \\ 
        \rightline{\@s_mail} \\
        \rightline{\linkedinview \cps \githubview} \\ 
        } % 
}

% Covverletterview

\newcommand\coverletter[1]{ 
\\  \coverlettersubview 
\section{} \vspace{1ex} 
\textbf{ Dear \@contactperson, \\[0.1cm]}
  #1
}

\newcommand\coverlettersubview{
\begin{tabular}{>{\scshape \bfseries \color{\@themecolor}}l  >{\small }l}
Company: & \@companyname \\
Position: & \@claimedposition \\
Address: & \@companyaddress \\
\end{tabular}
}


% Helper commands

\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

%colorfulpipeseperator

\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}

\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

% Edit section styles

\titleformat{\section}      % Customise the \section command 
  {\large\bfseries\scshape\raggedright\color{\@themecolor}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {\ruleafter}                           % Can be used to insert code before the heading

\titlespacing*{\section}{-1pt}{0pt}{0pt}

% Textview commands

\newcommand{\experience}[2]{%
  \mbox { \hspace{1em} \scshape \textbf{#1} }%
}

\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black!60!\@themecolor} #1 } 
}


\newcommand{\datedexperience}[3]{%
  \begin{small} \mbox { \hspace{1em} \scshape \textbf{#1} } \end{small} \begin{footnotesize} \textit{\positiontext{#2}}\end{footnotesize} \hfill \datetext{#3}\\[0.01cm] %
}

\newcommand{\explanation}[1]{%
    \mbox { \rmshape \hspace{1.2em} \footnotesize #1}\\[0.05cm] %\rmshape for normal \scshape for small caps
}

\newcommand{\explanationdetail}[1]{%
    \indent \begin{minipage}{0.96\linewidth} \footnotesize #1 \end{minipage} \\[0.1cm]
}

\newcommand{\itemwithtext}[1]{%
    \begin{minipage}{\linewidth} \footnotesize \item #1 \end{minipage}
}

\newcommand{\addblocktext}[2]{%
  \section{#1} 
  \indent \explanationdetail{\hspace{4ex} #2}
}

\newcommand\createskill[2]{%
    \textsc{\textbf{#1}} & #2
}

\newcommand\createtablecontent[1]{%
    \foreach \x [count=\xi] in {#1} {\ifthenelse{\xi=1}{\x}{\\ \x}}
}

\newcommand\createskillsanothertry[1]{%not used
  \begin{tabular}{r|l}
      \createtablecontent{#1}
        \end{tabular}
}

\newcommand\createskills[1]{%
\explanationdetail{
  \begin{tabular}{rl}
    \makeatletter
    \@for\thisitem:=#1\do{\thisitem\\[0.1cm]}
    \makeatother
    \end{tabular}
}
}

\newcommand\createbullets[1]{%
    \renewcommand{\labelitemi}{\coloredbullet}
  \begin{itemize}
    \makeatletter
    \@for\thisitem:=#1\do{\itemwithtext{\thisitem}}
    \makeatother
  \end{itemize}
}

\newcommand\createfootnote{%
  \renewcommand{\footnotesize}{\fontsize{7pt}{11pt}\selectfont}
    \renewcommand\footnoterule{\rule{0.3\linewidth}{0.5pt}}
    \let\thefootnote\relax\footnote{\today\ / \href{https://github.com/muratcankaracabey/latex_cv}{source code}}}

%%%%%% Created by AMIZZ %%%%%%
% Experience blurb inclusions, for easy integration into job-customized resumes

%%% Work Experience
\newcommand\experienceblockDSI{
    \datedexperience{Junior Data Scientist}{UBC Data Science Institute}{2023-Fall to Current} 
    % \explanation{\coloredbullet\ Design and develop transformer methods for NLP processes in applied cancer research}
    \explanation{\coloredbullet\ Created and tested segmentation models to aid NLP transformer work with varied clinical reports}
    % \explanation{\coloredbullet\ Designed and developed BERT transformer classification models using NLP and BERT for applied cancer research}
    \explanation{\coloredbullet\ Applied modified BERT transformer classification models for use in applied cancer research}
    % \explanation{\coloredbullet\ Analyze and visualize PT and CT medical reports for cancer prediction}
    \explanation{\coloredbullet\ Co-authored research papers on breast cancer relapse predictability based on PET/CT/Pathology data}
    % \explanation{\coloredbullet\ Design, develop, implement, and evaluate machine learning methods, for the analysis of text data}
    % \explanation{\coloredbullet\ Take part in NLP research projects and provide stakeholders with kept progress reports}
    % \explanation{\coloredbullet\ Currently undergoing an 8-month NLP-based Data Science research internship for applied hospital data} 
    % \explanation{\coloredbullet\ Use of transformers and statistical processing to parse large language datasets} 
}
\newcommand\experienceblockTA{
    \datedexperience{Teaching Assistant and Tutor}{University of British Columbia}{2023-Summer to Current} 
    \explanation{\coloredbullet\ Tutored, help teach, and grade for an upper level course in \emph{Intermediate Algorithm Design}} 
}
\newcommand\experienceblockCiti{
    \datedexperience{Technology Transformation Analyst}{Citigroup}{2023-Summer} 
    \explanation{\coloredbullet\ Completed and documented validations of controls over data uploads to Ruby Applications} 
    \explanation{\coloredbullet\ Ensured continuation of Consent Orders on historical programs, presenting to interdisciplinary teams}
    % \explanation{\coloredbullet\ Performed Regulatory Validations of Actions in Response to Consent Orders}
}
\newcommand\experienceblockTec{
    \datedexperience{Visiting Research Fellow}{Tecnologico de Monterrey}{2022-Summer} 
    \explanation{\coloredbullet\ Researched a new application for search algorithms as hyper-heuristics on combinatorial optimization problems} 
    \explanation{~~~~~~ \coloredbullet\ Used the A* and MCTS algorithms in \emph{Python} as Hyper-Heuristics to solve the Firefighter problem} 
    % \explanation{\coloredbullet\ Explored a new method of analysing \textbf{Combinatorial Optimization Problems} using Hyper-Heuristics} 
    \explanation{\coloredbullet\ Acceptance into ICUR Conference and awaiting other journal and conference acceptances} 
}
\newcommand\experienceblockExertus{
    \datedexperience{Junior Software Developer}{Exertus Consulting Group}{2021-Summer} 
    \explanation{\coloredbullet\ Used \emph{C\#} and \emph{React} to implement a map overlay of shipments for visual performance tracking}
    \explanation{\coloredbullet\ Increased productivity by creating an automated Whatsapp system to notify stakeholders of shipment details } 
    %\explanation{\coloredbullet\ Eliminated file transfer overheads by using Windows Interface to link the company website to all system scanners}
    \explanation{\coloredbullet\ Designed a Route Assignment Algorithm, minimizing time driving without a shipment by 33\%} 
}

%%% Projects and Competitions
\newcommand\experienceblockMCTS{
    \datedexperience{Monte Carlo Tree Search and Minimax Hybrid AIs}{Python Research Project}{2019-Spring to 2020-Spring} 
    \explanation{\coloredbullet\ Used a mix of \emph{Monte Carlo Tree Search} and \emph{Minimax} with Alpha-Beta pruning to demonstrate if}
    \explanation{~~~~~a certain kind of hybrid would outperform either algorithm on their own} 
    \explanation{\coloredbullet\ Results were very good, outperforming both algorithms, and aligned with similar hybrid approaches}
}
\newcommand\experienceblockTerminal{
    \datedexperience{Correlation One Terminal Competition (With Citadel)}{Python}{2022 (2x) and 2023 (2x)} 
    % \explanation{\coloredbullet\ Competitive turn based AI and algorithm competition between top universities for \$15k in prizes} 
    % \explanation{\coloredbullet\ Placed in the upper quintiles both times, with one algorithm being in the top 5 in ELO}
    \explanation{\coloredbullet\ Placed in Top-5 ELO for AI algorithm competition between top universities with \$15k in prizes} 
}
\newcommand\experienceblockWER{
    \datedexperience{Qualified to WER Robotics Nationals}{Custom Language}{2019-Winter} 
    \explanation{\coloredbullet\ Programmed the Robot to race towards tasks that it would then complete for points} 
    \explanation{\coloredbullet\ Including path finding, alignment of mechanical systems, tool usage, and avoiding crashes } 
}
\newcommand\experienceblockCPSCML{ %CPSC330
    \datedexperience{Bank Loan Qualification System}{Python}{2023-Fall} 
    \explanation{\coloredbullet\ Created a Machine Learning system with \emph{Scikit-learn} to approve loans and analyze related factors} 
    \explanation{\coloredbullet\ Developed decision rational for end user understanding and ensured no discriminatory bias}
}
\newcommand\experienceblockDSCITwo{ % STAT 201
    \datedexperience{Basketball Betting System}{R Programming Language}{2022-Winter} 
    \explanation{\coloredbullet\ Created a Machine Learning system to predict optimal betting for NBA matches} 
    \explanation{\coloredbullet\ Used time series and historical fan favoritism to find the optimal betting strategy}
}
\newcommand\experienceblockDSCIThree{ % STAT 301
    \datedexperience{Stock Price Trend Analysis}{R Programming Language}{2022-Fall} 
    \explanation{\coloredbullet\ Analyzed historic trends and correlation between supplier stock and inventory to future producer stock changes} 
    \explanation{\coloredbullet\ Discussed time series, regressions, and industry statements to conclude the correlations}
}
\newcommand\experienceblockDSCIFour{ % DSCI 310
    \datedexperience{Data Analysis of School Performance Predictors}{Python}{2022-Winter} 
    \explanation{\coloredbullet\ Applied automated workflows and Dockerfile practices in GitHub to create an integrated Jupyter analysis}
    \explanation{\coloredbullet\ Engaged Data Science techniques to delimit the importance of factors influencing school performance}
}
\newcommand\experienceblockFIRST{
    \datedexperience{FIRST Robotics Competition}{Java}{2018-2020} 
    \explanation{\coloredbullet\ Designed and implemented a visual detection and guidance system for autonomous playing}
    \explanation{\coloredbullet\ Made a controller scheme for manual controlling of the robot, including scoring mechanism}
}
\newcommand\experienceblockFlyBot{
    \datedexperience{Drone from Scratch}{Arduino}{2018-Sept} 
    \explanation{\coloredbullet\ Programmed a Bluetooth Control Scheme alongside flight correction for a tricopter in a 24h hackathon} 
}
\newcommand\experienceblockUAS{
    \datedexperience{Machine Learning for Drone Team}{Python}{2021-Fall} 
    \explanation{\coloredbullet\ Built a Optical Character Recognition System to identify objects over 100ft away for competition points} 
}
\newcommand\experienceblockCPSCOne{ % CPSC 210
    \datedexperience{Class Scheduler}{Java}{2021-Fall}
    \explanation{\coloredbullet\ Automated creation of all possible schedules, with full code coverage and testing } 
    \explanation{\coloredbullet\ Applied OOP principles for searching and filtering of desired features} 
}
\newcommand\experienceblockCPSCTwo{ % CPSC 310
    \datedexperience{Discord Bot with API and File Backend}{JavaScript and Python}{2023-Winter}
    \explanation{\coloredbullet\ Used asychronous code to take in varied UBC files in a RESTful way for human display and filtering} 
    \explanation{\coloredbullet\ Created an interactable Discord front-end with detailed bot communication, creating a better user experience} 
}
