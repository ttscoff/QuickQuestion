## 1.2.7

- Fix regex to allow nested parens in @copy

## 1.2.6

- New build process

## 1.2.5

- Much improved presentation of results when using fzf

## 1.2.4

- Way better searching, progressively fuzzier until a match is found
- Only ever show the best result, no point in showing a ton of matches
- Use fzf if available, for searching and for filtering multiple matches

## 1.2.3

- Bugfixes

## 1.2.2

- OR query when AND failed was way too broad, replaced
  with phrase and no boolean
- Added debugging

## 1.2.1

- Colorize output
- List all known questions with -l

## 1.2.0

- Add -p switch to pull answer from clipboard when adding a question
- Improve option parsing
- Allow -e when adding answer to open new question file in editor
- Allow multi-line input when adding interactively
- Allow '#atag' to translate to 'tag:atag' in spotlight search
- Allow configuration via environment variables

## 1.1.1

- Only opens url/copies code from one note if there are multiple answers
