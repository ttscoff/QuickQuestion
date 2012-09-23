(* Takes a string in the format:

	question text: Answer text

The ": " is required to split the parts *)on handle_string(message)		set {astid, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ": "}	set {question, answer} to {text item 1 of message, text item 2 of message}	set AppleScript's text item delimiters to astid	do shell script "~/scripts/qq -a \"" & question & "\" \"" & answer & "\""	tell application "LaunchBar" to display in large type "Question added"	end handle_string