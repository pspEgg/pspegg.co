---
title: DRY svg vector processing
date: 2013-05-04
---

# DRY svg

.svg is the extension for plain text vector graphics. Copy the chunk of text along side your html and browsers[^1] will draw the graphics!

DRY svg is the *Don't Repeat Yourself* for going from Adobe Illustrator to the chunk of text alongside html.

To *repeat* myself, I would within the "save as..." UI export each artboard as separate svg files. go through the files copying the contents `<svg>` tags. Then I would put them in separate html files to be assembled into pages by a blog engine.

From svg to html is good old plain text manipulation and transportation. If you have trouble with this part, rejoice, because this stuff is worth learning. On the other hand scripting illustrator to export the svgs merely shows you the darkest side of adobe applications.

For example its svg export options did not get updated with a "multiple artboards" option albeit having that in the UI. Well why not export artboards to their separate .ai files, then export each to .svg. *Turns out* the save artboards as .ai options exists! but were removed since version 13.

Bending to our Creative Suites overlord's will we export artboards to multiple illustrator files and delete original, making the one-artboard files as art source.

This Applescript takes file names from the command line and export those as .svg:

    #svg.scpt
    on run arg
    	#set arg to {"icon_jet.ai", "icon_jug.ai"}
    	tell application "Finder"
    		set folderPath to parent of (path to me) as string
    		repeat with i from 1 to count arg
    			set fullPath to folderPath & (item i of arg)
    			tell application "Adobe Illustrator"
    				#set user interaction level to never interact
    				open file fullPath without dialogs
			
    				export current document to folderPath as SVG
    			end tell
    		end repeat
    	end tell
    end run

and `` osascript svg.scpt `ls | egrep "\.ai"` `` calls the script, giving it all the .ai files in a folder. put it in a .sh and make it executable and you get an export-to-svg shell script. pipe it whatever.

[^1]: IE8.0 or later. Android 2.2 or later.