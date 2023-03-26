return {
  s(
    'header',
    fmt(
      'Christopher Carrick'
      .. '\n<professor_name>'
      .. '\n<class_name>'
      .. '\n<date>'
      .. '\n\n'
      .. '\\begin{center}\n  <title>\n\\end{center}'
      .. '\n\n'
      .. '\\setlength{\\parindent}(0.5in)'
      .. '\n\n'
      .. '<page_content>'
      .. '\n',
      {
        professor_name = i(1, 'Professor'),
        class_name = i(2, 'Class Name'),
        date = i(3, 'Date'),
        title = i(4, 'Title'),
        page_content = i(5, 'Content'),
      },
      {
        delimiters = '<>',
      }
    )
  ),

  s(
    'workscited',
    fmt(
    '\\newpage' .. '\n\n' .. '\\begin{center}Works Cited\\end{center}\n\n<>',
    { i(0) },
    { delimiters = '<>' })
  ),
  -- s('cite', fmt('\newpage'..'\n\n'..'\\begin{center}Works Cited\\end{center}\n\n{}', { i(0) })),
}
