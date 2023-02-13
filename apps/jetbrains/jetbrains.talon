# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs
# multiple_cursors.py support end

# Auto complete
complete: user.idea("action CodeCompletion")
perfect: user.idea("action CodeCompletion,action CodeCompletion")
smart: user.idea("action SmartTypeCompletion")
(done | finish): user.idea("action EditorCompleteStatement")
# Copying
grab <number>: user.idea_grab(number)
# Actions
(action | please): user.idea("action GotoAction")
(action | please) <user.text>:
    user.idea("action GotoAction")
    insert(text)
# Refactoring
refactor: user.idea("action Refactorings.QuickListPopupAction")
refactor <user.text>:
    user.idea("action Refactorings.QuickListPopupAction")
    insert(text)
extract variable: user.idea("action IntroduceVariable")
extract field: user.idea("action IntroduceField")
extract constant: user.idea("action IntroduceConstant")
extract parameter: user.idea("action IntroduceParameter")
extract interface: user.idea("action ExtractInterface")
extract method: user.idea("action ExtractMethod")
refactor in line: user.idea("action Inline")
refactor move: user.idea("action Move")
refactor rename: user.idea("action RenameElement")
rename file: user.idea("action RenameFile")
fix (format | formatting): user.idea("action ReformatCode")
fix imports: user.idea("action OptimizeImports")
#navigation
(go declaration | follow): user.idea("action GotoDeclaration")
go implementation: user.idea("action GotoImplementation")
go usage: user.idea("action FindUsages")
go type: user.idea("action GotoTypeDeclaration")
go test: user.idea("action GotoTest")
go back: user.idea("action Back")
go forward: user.idea("action Forward")
# Search
find (everywhere | all): user.idea("action SearchEverywhere")
find (everywhere | all) <user.text> [over]:
    user.idea("action SearchEverywhere")
    sleep(500ms)
    insert(text)
(search | find) class: user.idea("action GotoClass")
(search | find) file: user.idea("action GotoFile")
(search | find) path: user.idea("action FindInPath")
(search | find) symbol: user.idea("action GotoSymbol")
(search | find) symbol <user.text>$:
    user.idea("action GotoSymbol")
    insert(text)
    key("enter")
recent: user.idea("action RecentFiles")

surround [this] with <user.text> [over]:
    idea("action SurroundWith")
    sleep(500ms)
    insert(text)
# Making these longer to reduce collisions with real code dictation.
insert generated <user.text> [over]:
    user.idea("action Generate")
    sleep(500ms)
    insert(text)
insert template <user.text> [over]:
    idea("action InsertLiveTemplate")
    sleep(500ms)
    insert(text)
create (template | snippet): user.idea("action SaveAsTemplate")
# Recording
toggle recording: user.idea("action StartStopMacroRecording")
change (recording | recordings): user.idea("action EditMacros")
play recording: user.idea("action PlaybackLastMacro")
play recording <user.text> [over]:
    idea("action PlaySavedMacrosAction")
    insert(text)
    sleep(500ms)
    Key("enter")
# Marks
go mark: user.idea("action ShowBookmarks")
toggle mark: user.idea("action ToggleBookmark")
go next mark: user.idea("action GotoNextBookmark")
go last mark: user.idea("action GotoPreviousBookmark")
toggle mark <number>: user.idea("action ToggleBookmark{number}")
go mark <number>: user.idea("action GotoBookmark{number}")
# Folding
expand deep: user.idea("action ExpandRegionRecursively")
expand all: user.idea("action ExpandAllRegions")
collapse deep: user.idea("action CollapseRegionRecursively")
collapse all: user.idea("action CollapseAllRegions")
# miscellaneous
# XXX These might be better than the structural ones depending on language.
go next (method | function): user.idea("action MethodDown")
go last (method | function): user.idea("action MethodUp")
# Clipboard
clippings: user.idea("action PasteMultiple")
copy path: user.idea("action CopyPaths")
copy reference: user.idea("action CopyReference")
copy pretty: user.idea("action CopyAsRichText")
# File Creation
create sibling: user.idea("action NewElementSamePlace")
create sibling <user.text> [over]:
    user.idea("action NewElementSamePlace")
    sleep(500ms)
    insert(text)
create file: user.idea("action NewElement")
create file <user.text> [over]:
    user.idea("action NewElement")
    sleep(500ms)
    insert(text)
# Task Management
go task: user.idea("action tasks.goto")
go browser task: user.idea("action tasks.open.in.browser")
switch task: user.idea("action tasks.switch")
clear task: user.idea("action tasks.close")
configure servers: user.idea("action tasks.configure.servers")
# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
git pull: user.idea("action Vcs.UpdateProject")
git commit: user.idea("action CheckinProject")
git push: user.idea("action CheckinProject")
git log: user.idea("action Vcs.ShowTabbedFileHistory")
git branches: 
    user.idea("action Vcs.QuickListPopupAction")
    sleep(150ms)
    key("7")
git (annotate | blame): user.idea("action Annotate")
git menu: user.idea("action Vcs.QuickListPopupAction")
# Tool windows:
# Toggling various tool windows
toggle project: user.idea("action ActivateProjectToolWindow")
toggle find: user.idea("action ActivateFindToolWindow")
toggle run: user.idea("action ActivateRunToolWindow")
toggle debug: user.idea("action ActivateDebugToolWindow")
toggle events: user.idea("action ActivateEventLogToolWindow")
toggle terminal: user.idea("action ActivateTerminalToolWindow")
toggle git: user.idea("action ActivateVersionControlToolWindow")
toggle structure: user.idea("action ActivateStructureToolWindow")
toggle database: user.idea("action ActivateDatabaseToolWindow")
toggle database changes: user.idea("action ActivateDatabaseChangesToolWindow")
toggle make: user.idea("action ActivatemakeToolWindow")
toggle to do: user.idea("action ActivateTODOToolWindow")
toggle docker: user.idea("action ActivateDockerToolWindow")
toggle favorites: user.idea("action ActivateFavoritesToolWindow")
toggle last: user.idea("action JumpToLastWindow")
toggle hierarchy: user.idea("action ActivateHierarchyToolWindow")
# Pin/dock/float
toggle pinned: user.idea("action TogglePinnedMode")
toggle docked: user.idea("action ToggleDockMode")
toggle floating: user.idea("action ToggleFloatingMode")
toggle windowed: user.idea("action ToggleWindowedMode")
toggle split: user.idea("action ToggleSideMode")
# Settings, not windows
toggle tool buttons: user.idea("action ViewToolButtons")
toggle toolbar: user.idea("action ViewToolBar")
toggle status [bar]: user.idea("action ViewStatusBar")
toggle navigation [bar]: user.idea("action ViewNavigationBar")
# Active editor settings
toggle power save: user.idea("action TogglePowerSave")
toggle whitespace: user.idea("action EditorToggleShowWhitespaces")
toggle indents: user.idea("action EditorToggleShowIndentLines")
toggle line numbers: user.idea("action EditorToggleShowLineNumbers")
toggle (bread crumbs | breadcrumbs): user.idea("action EditorToggleShowBreadcrumbs")
toggle gutter icons: user.idea("action EditorToggleShowGutterIcons")
toggle wrap: user.idea("action EditorToggleUseSoftWraps")
toggle parameters: user.idea("action ToggleInlineHintsAction")
# Toggleable views
toggle fullscreen: user.idea("action ToggleFullScreen")
toggle distraction [free mode]: user.idea("action ToggleDistractionFreeMode")
toggle presentation [mode]: user.idea("action TogglePresentationMode")
# Toggle additionals
toggle comment: code.toggle_comment()
# Quick popups
change scheme: user.idea("action QuickChangeScheme")
# Always javadoc
(toggle | pop) (doc | documentation): user.idea("action QuickJavaDoc")
(pop deaf | toggle definition): user.idea("action QuickImplementations")
pop type: user.idea("action ExpressionTypeInfo")
pop parameters: user.idea("action ParameterInfo")
# Breakpoints / debugging
go breakpoints: user.idea("action ViewBreakpoints")
toggle [line] breakpoint: user.idea("action ToggleLineBreakpoint")
toggle method breakpoint: user.idea("action ToggleMethodBreakpoint")
run menu: user.idea("action ChooseRunConfiguration")
run test: user.idea("action RunClass")
run test again: user.idea("action Rerun")
debug test: user.idea("action DebugClass")
step over: user.idea("action StepOver")
step into: user.idea("action StepInto")
step smart: user.idea("action SmartStepInto")
step to line: user.idea("action RunToCursor")
continue: user.idea("action Resume")
# Grow / Shrink
(grow | shrink) window right: user.idea("action ResizeToolWindowRight")
(grow | shrink) window left: user.idea("action ResizeToolWindowLeft")
(grow | shrink) window up: user.idea("action ResizeToolWindowUp")
(grow | shrink) window down: user.idea("action ResizeToolWindowDown")
# Movement
go next (error | air): user.idea("action GotoNextError")
go last (error | air): user.idea("action GotoPreviousError")
fix next (error | air):
    user.idea("action GotoNextError")
    user.idea("action ShowIntentionActions")
fix last (error | air):
    user.idea("action GotoPreviousError")
    user.idea("action ShowIntentionActions")
# Special Selects
select less: user.idea("action EditorUnSelectWord")
select (more | this): user.idea("action EditorSelectWord")
#jet brains-specific line commands. see line_commands.talon for generic ones
expand <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action ExpandRegion")
collapse <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action CollapseRegion")
paste <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action EditorPaste")
refactor <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action Refactorings.QuickListPopupAction")
clone <number>: user.line_clone(number)

#find/replace
clear last <user.text> [over]: user.idea("find prev {text}, action EditorBackSpace")
clear next <user.text> [over]: user.idea("find next {text}, action EditorBackSpace")
comment last <user.text> [over]:
    user.idea("find prev {text}, action CommentByLineComment")
comment next <user.text> [over]:
    user.idea("find next {text}, action CommentByLineComment")
go last <user.text> [over]: user.idea("find prev {text}, action EditorRight")
go next <user.text> [over]: user.idea("find next {text}, action EditorRight")
paste last <user.text> [over]:
    user.idea("find prev {text}, action EditorRight, action EditorPaste")
paste next <user.text> [over]:
    user.idea("find next {text}, action EditorRight, action EditorPaste")
refactor last <user.text> [over]:
    user.idea("find prev {text}, action Refactorings.QuickListPopupAction")
refactor next <user.text> [over]:
    user.idea("find next {text}, action Refactorings.QuickListPopupAction")
replace last <user.text> [over]: user.idea("find prev {text}, action EditorPaste")
replace next <user.text> [over]: user.idea("find next {text}, action EditorPaste")
select last <user.text> [over]: user.idea("find prev {text}")
select next <user.text> [over]: user.idea("find next {text}")

select camel left: user.extend_camel_left()
select camel right: user.extend_camel_right()
go camel left: user.camel_left()
go camel right: user.camel_right()

#custom
move line down: user.idea("action MoveLineDown")
move line up: user.idea("action MoveLineUp")
go replace: user.idea("action Replace")
build module: user.idea("action MakeModule")
compile module: user.idea("action Compile")
go next change: use.idea("action JumpToNextChange")
copy that: key(cmd-c)
[pace|paste] that: key(cmd-v)
compare with branch: key(cmd-shift-w)
system print line: "System.out.println();"
mcv:
  insert("mvn clean spotless:apply verify")
  key(enter)
gpo:
  insert("gpo")
  key(enter)
conditional: "if ("
spotless apply:
  insert("mvn spotless:apply")
  key(enter)
mcc:
  insert("mvn clean spotless:apply compile")
  key(enter)
go terminal: key(alt-f12)
go project: 
    key(cmd-1)
    sleep(300ms)
    key(1)
go hierarchy: key(ctrl-alt-h)
quick fix: key(alt-enter)
find and replace: key(cmd-shift-r)
new array list: insert("new ArrayList()")
list: "List<"
context action: key(alt-enter)
clap: key(cmd-shift-enter)

# running and debugging
method run: key(ctrl-shift-r)
method debug: key(ctrl-shift-d)
method next: key(ctrl-shift-down)
method previous: key(ctrl-shift-up)
method all: key(cmd-f12)
method signature: key(cmd-f6) 
method rename: key(shift-f6)


# operators
op and: insert(" && ")
op equals: insert(" == ")
op not null: insert("!= null")
op null: insert("== null")
op conditional:
    insert("if () {}")
    sleep(300ms)
    key(left)
    key(left)
    key(left)
    key(left)
op return: insert("return ")
op op equals: 
    insert(".equals()")
    sleep(300ms)
    key(left)
op is empty string:
    insert("StringUtils.isEmpty\(\)")
    sleep(300ms)
    key(left)
op is empty list:
    insert("CollectionUtils.isEmpty\(\)")
    sleep(300ms)
    key(left)
op empty list:
    insert("Collections.emptyList()")
op nullable: "@Nullable"
op autowired: "@Autowired"
op service: "@Service"
op required args: "@RequiredArgsConstructor"
op data: "@Data"
op pf: "private final "
op list:
    insert("List<>")
    sleep(300ms)
    key(left)
op pfs: "private final String"
op pfl: "private final Long"