function start_of_line(line_to_cursor) return line_to_cursor == '' end

return {
  s(
    '!mla',
    fmt(
      [[
\documentclass[mla8]{mla}                       % use mla as base
\usepackage{setspace} \singlespacing            % use single spacing
\pagestyle{empty}                               % remove page numbers and header
\setlength{\parindent}{0pt}                     % disable indentation
% \setlength{\parindent}{0.25in}

\renewcommand{\labelitemi}{-}                   % adjust how list bullets are drawn
\renewcommand{\labelitemii}{\labelitemi}
\renewcommand{\labelitemiii}{\labelitemi}
\renewcommand{\labelitemiv}{\labelitemi}

\title{<title>}
\author{<author>}
\date{<date>}
\professor{<prof>}
\course{<course>}

\begin{document}
<body>
\end{document}
]],
      {
        title = i(1, 'Title'),
        author = i(2, 'Author'),
        date = i(3, 'Date'),
        prof = i(4, 'Professor'),
        course = i(5, 'Course'),
        body = i(0),
      },
      {
        delimiters = '<>',
      }
    )
  ),
  s(
    '!apa',
    fmt(
      [[
\documentclass[stu,12pt]{apa7}
\usepackage[american]{babel}
\usepackage{csquotes}

% % \usepackage[style=apa,sortcites=true,sorting=nyt]{biblatex}
% \usepackage[style=apa,sortcites=true,sorting=nyt,backend=biber]{biblatex}
%
% % \addbibresource{essay.bib}
%
% % Removes month from bibliography entries, which shouldn't be there for academic journals - optionally, remove the month entries from your .bib file on the offending files. Comment it out if using popular media, newspaper articles, etc. that need the month field.
% \AtEveryBibitem{\clearfield{month}}
%
% \DeclareLanguageMapping{american}{american-apa}
%
% % Removes "retrieved from on date" from bibliography entry unless it is a wiki URL, which is closer to the spirit of APA's rule. See biblatex-apa documentation for more info.
% \DeclareSourcemap{
%   \maps[datatype=bibtex]{
%     \map{
%       \step[fieldsource=url, notmatch=\regexp{wiki}, final=1]
%       \step[fieldset=urldate, null]
%     }
%   }
% }
%
% % % Removes month from bibliography entries, which shouldn't be there for academic journals - optionally, remove the month entries from your .bib file on the offending files. Comment it out if using popular media, newspaper articles, etc. that need the month field.
% % \AtEveryBibitem{ \clearfield{month} }
% % \DeclareLanguageMapping{american}{american-apa}

\title{<title>}
\author{<author>}
\duedate{<date>}
\affiliation{<university>}
\professor{<prof>}
\course{<course>}
% \shorttitle{<shorttitle>}

\begin{document}

\maketitle

<body>

\printbibliography

\end{document}
]],
      {
        title = i(1, 'Title'),
        author = i(2, 'Author'),
        date = i(3, 'Date'),
        university = i(4, 'University'),
        prof = i(5, 'Professor'),
        course = i(6, 'Course'),
        shorttitle = rep(1),
        body = i(0),
      },
      { delimiters = '<>' }
    )
  ),
}
