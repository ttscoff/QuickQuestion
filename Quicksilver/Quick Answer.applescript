(* Takes a string in the format:
	question text: Answer text
The ": " is required to split the parts *)using terms from application "Quicksilver"	on process text (message)		set {astid, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ": "}		set {question, answer} to {text item 1 of message, text item 2 of message}		set AppleScript's text item delimiters to astid		do shell script "~/bin/qq -a \"" & question & "\" \"" & answer & "\""		tell application "Quicksilver" to show large type "Question added"	end process textend using terms from