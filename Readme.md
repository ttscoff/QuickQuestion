# Quick Question

The `qq` script and related extensions are designed to keep an archive of files with questions as the filename and answers as the content. It works well with Notational Velocity and nvALT, but can function as an archive of knowledge with nothing but a Mac and a command line. Scripts are included for LaunchBar and Alfred, as well as a command line tool.

The story behind the script is: I forget everything. I forget what I was working on last night. I forget where I left important things. I forget how I solved a major problem and have to work it out again next time it comes up. I forget where I saved the perfect settings I found for h.264 compression. You get the picture. So I've started building an archive of plain text files with questions and answers, and a system which makes it easy to add new knowledge at any time. The question format makes it easy to query, even when I don't remember the answer at all.

The system is very simple. A bunch of plain text files, each titled with one question and containing one answer. Searching and sorting is handled my the `mdfind` Spotlight interface with scripts and extensions that focus the search to a narrow scope with predefined options. The knowledgebase that's built is bulletproof and portable, scriptable and easily searchable. Plus, it works the same way as Notational Velocity, so they make a great pair.

I use it with nvALT and sync to Simplenote and Dropbox, which means I can enter new questions and their answers from any mobile device or remote computer, in addition to being able to use the command line tool, LaunchBar actions and Alfred extensions. It keeps me sane.

### Installation ###

**Command line**
: Put the `qq` script into a folder in your path and make it executable with `chmod a+x /path/to/qq`. Edit the script to set the location of your notes folder and the extension you use. You may want to set a different preferred "question" prefix if you already have one (or don't want filenames that need constant escaping).

**LaunchBar**
: Move the two .scpt files into `~/Library/Application Support/LaunchBar/Actions/`. These scripts require that the above command line script is in place and need to be edited with the proper *full* path to the script.

**Alfred**
: The Alfred extensions are standalone and do note require the `qq` script to be installed. Simply import the extensions into Alfred and the `qq` and `qa` commands will be available. Once imported, there are several configuration variables that need to be set in the top of the script.

**Notational Velocity/nvALT**
: By nature, you don't need anything special to use this system with NV. You just need to save your notes to plain text files if you want them to be accessible to `mdfind` and other system tools.
: To get simple command line access to the question in your NV folder, set up the configuration in the `qq` script above to point to your NV notes folder. This will allow you to run speedy queries confined to just that directory, and enter notes quickly from other sources. Notes entered from the command line or LaunchBar/Alfred will show up instantly in your NV notes list.

### Usage ###

**Command line**
: Add questions and answers using `qq -a "Question" "Answer"`, e.g. `qq "What is the answer to life, the universe and everything?" "42"`. If `-a` is specified without any additional arguments, `qq` will enter interactive mode and ask you for the question and the answer individually, accepting input from STDIN.
: Ask a question using `qq fragmented question`, e.g. `qq meaning universe`. See the [Querying](#querying) section for more information on composing fragmented queries.

**LaunchBar**
: Add a question and answer by launching LaunchBar and typing "qa". Select the "Quick Answer" action and hit Space. Then type a string in the format "question: answer", e.g. "what is the meaning of life, the universe and everything: 42".
: Ask a question by typing "qq" and selecting the "Quick Question" action. Hit space and type a [fragmented query](#querying).

**Alfred**
: To add a question and answer to your archive, open Alfred and type "qa". Enter the question and answer in the format "question: answer", e.g. "qa is there anybody out there?: nope".
: To query your archive, type "qq" and enter a [fragmented query](#querying).

**Notational Velocity/nvALT**
: Notes will be prefixed with the string specified in the configuration (default "??"). You can start a search with the prefix and follow it with a fragmented query to find the question (and answer) you're looking for. Add new questions and answers by typing the prefix and the question in the search field, press enter to create a new note, and type the answer and any [additional meta](#additionalmeta).

### Composing questions ###

Ask yourself what question the search for this answer began with. Will that be the question you ask again when you've forgotten the answer a year (or month) later? Think about how you, personally, would phrase the question and shape it around keywords that you're pretty sure you would repeat.

Keep your questions in a natural language format, but avoid contractions and use "who, when, where, what, how and why" as much as possible. These words make it easy to sort out different types of questions about the same subject.

### Querying ###

When querying, only use operative terms to get the best results. "Where did I leave my glasses" will return poor results if the question you labeled it with was "Where did I put my glasses". Instead, query "where glasses" and you'll find the note instantly.

Running `qq` at the command line with no arguments will list all of the questions and their answers in your archive. This can be handy for using with `grep` to parse out pieces of questions and/or answers that you couldn't find otherwise.

### Additional meta ###

You can add additional meta within the contents of the file to help in locating the answer later by using the format `@(meta information)`. Anything within the parenthesis will be included in search, but the whole tag will be excluded from results in the `qq` script and the LaunchBar/Alfred actions.

An example of this would be a question like "What brand of cleaner did I use during the move?" The answer you gave was a cleaning solution you were really impressed with. A year later the only thing you may remember to ask is "cleaner," but you might not even remember that was the term you used. So you add "@(solution cleaning favorite)" to the answer. Now you can search for "favorite cleaning" or "cleaning solution" and still get the question you were looking for. It's similar to using tags, but you can be more verbose without cluttering up your pool of existing tags. In the example case, you can also use just the root or part of a word, e.g. `qq fav clean` to expand matching possibilities.

### Redacting answers ###

If you're using LaunchBar or Alfred it's assumed that you can locate the question file and open it in an editor of choice easily enough. It's even simpler if your questions are stored in Notational Velocity/nvALT as you can edit them at the same time you search for them.

From the command line you can use the `-e` argument to open the first result for the following query in the editor you specified in the configuration (`mate` by default). It expects a command-line tool, not an OS X application name. Most editors have these available.

### TODO ###

* Add "stop words" removal to the query string to automatically remove non-operative words and simplify the query transparently.
* Add some intelligence for running multiple queries from the same string; "how" and "what did" have similar meanings, but the semantics of the search will exclude the other's results.