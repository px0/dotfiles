Returning to TP and the vim plugin after a long time..
Compiled some notes to refresh myself.. Thought I's share the same here..

text file format:
----
- projects end with a colon
- tasks start with a hypen and a space
- all others are notes
- any item can be indented under any other item by prefixing with tab - this makes it a "sub-..." or sibling of the parent item

vim plugin behaviour:
----
- enter after task    = sibling task (generates CR autoindent hyphen space)
- enter after project = child task (generates CR autoindent tab hyphen space)
- enter after note    = sibling note (generates CR autoindent)
- enter on blank line = no effect = cursor moves to next line, first column (generates CR)
- (CR)                = carriage return)

vim plugin shortcuts:
----

- **\td**     Mark task as done
- **\tx**     Mark task as cancelled
- **\tt**     Mark task as today
- **\tD**     Archive @done items
- **\tX**     Show tasks marked as cancelled
- **\tT**     Show tasks marked as today
- **\t/**     Search for items including keyword
- **\ts**     Search for items including tag
- **\tp**     Fold all projects
- **\t.**     Fold all notes
- **\tP**     Focus on the current project
- **\tj**     Go to next project
- **\tk**     Go to previous project
- **\tg**     Go to specified project (need to give full "path" for indented projects - as xx:yy.. etc.)
- **\tm**     Move task to specified project
- after **\tp**, use zr/zR(exact antipode to **\tp**)/zc/zo to open/close folds. using right arrow key also opens folds.. have enable folding in vim first..

look and feel differences between taskpaper(tp) and vim plugin(vp):
----
 - project            : tp(bold font, ending colon visible), vp(bold, light pink, ending colon visible)
 - task               : tp(normal font, starting hypen/space visible), vp(normal font, green, starting hypen/space visible)
 - note               : tp(light font), vp(orange font)
 - "parentless" tasks : tp(starting hypen/space visible NOT visible), vp(visible)
 - indented project   : tp(shows more indentation compared to sibling tasks and notes), vp(no difference)
 - indented task      : tp(initial tab not visible.. task appears directly below parent with initial hyphen and space), vp(tab visible)
 - indented note      : tp(initial tab visible), vp(initial tab visible)


With regard to the look in iOS, wish the following could be addressed:
	- "parentless" tasks are missing the initial hyphen plus space
	- indented projects should appear at the same indentation level compared to sibling tasks and notes

