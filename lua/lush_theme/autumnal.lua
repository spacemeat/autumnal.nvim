--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local Black = hsl(0, 0, 0)
local White = hsl(0, 100, 100)
local DarkMud = hsl(20, 100, 3)
local Charcoal = hsl(0, 0, 10)
local Purple = hsl(300, 40, 20)
local SunsetGold = hsl(35, 100, 50)
local SunsetRed = hsl(0, 100, 60)
local BloodRed = hsl(0, 100, 50)
local SunsetMauve = hsl(350, 100, 60)
local PumpkinOrange = hsl(20, 100, 50)
local Rust = hsl(15, 90, 30)
local OvercastGray = hsl(0, 0, 50)
local CumulousGray = hsl(0, 0, 80)
local HazyBlueSky = hsl(240, 40, 70)
local CrispBlueSky = hsl(215, 70, 60)
local LingeringLeaf = hsl(120, 40, 28)
local Evergreen = hsl(120, 30, 10)
local Cider = hsl(20, 100, 15)
local Wine = hsl(350, 80, 10)
local DarkHoney = hsl(20, 90, 8)
local DeadLeaf = hsl(30, 50, 60)


-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		ColorColumn    { bg = Wine }, -- Columns set with 'colorcolumn'
		Conceal        { fg = OvercastGray }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor         { fg = Black, bg = SunsetGold }, -- Character under the cursor
		CurSearch      { fg = Black, bg = SunsetMauve }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor        { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM       { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn   { bg = Charcoal }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine     { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory      { fg = CrispBlueSky }, -- Directory names (and other special names in listings)
		DiffAdd        { bg = Evergreen }, -- Diff mode: Added line |diff.txt|
		DiffChange     { bg = Purple }, -- Diff mode: Changed line |diff.txt|
		DiffDelete     { bg = Wine }, -- Diff mode: Deleted line |diff.txt|
		DiffText       { bg = Cider }, -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer    { fg = SunsetRed }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor     { Cursor }, -- Cursor in a focused terminal
		TermCursorNC   { Cursor }, -- Cursor in an unfocused terminal
		ErrorMsg       { fg = CumulousGray, bg = SunsetRed }, -- Error messages on the command line
		VertSplit      { fg = OvercastGray }, -- Column separating vertically split windows
		Folded         { bg = DarkMud }, -- Line used for closed folds
		FoldColumn     { bg = DarkMud }, -- 'foldcolumn'
		SignColumn     { bg = DarkMud }, -- Column where |signs| are displayed
		IncSearch      { CurSearch }, --fg = Black, bg = SunsetGold }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute     { fg = Black, bg = PumpkinOrange }, -- |:substitute| replacement text highlighting
		LineNr         { fg = CrispBlueSky }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove    { LineNr }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow    { LineNr }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr   { fg = SunsetGold }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold { FoldColumn }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign { SignColumn }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen     { bg = Purple }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg        { fg = White, bg = BloodRed }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		NonText        { EndOfBuffer }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal		   { fg = OvercastGray, bg = DarkMud }, -- Normal text
		NormalFloat    { fg = CumulousGray, bg = DarkMud.li(1) }, -- Normal text in floating windows.
		FloatBorder    { NormalFloat }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu          { fg = OvercastGray }, -- Popup menu: Normal item.
		PmenuSel       { CursorLine }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search         { fg = Black, bg = SunsetGold }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine     { fg = White, bg = DarkHoney }, -- Status line of current window
		StatusLineNC   { fg = PumpkinOrange, bg = Black }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		Visual         { CursorLine }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg     { }, -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows


		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--FOO LOOK I MADE A CHANJ
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment			{ fg = LingeringLeaf },--{ fg = Normal.fg.da(50), bg = DarkMud }, -- Any comment

		Constant        { fg = HazyBlueSky }, -- (*) Any constant
		String          { fg = SunsetRed }, --   A string constant: "this is a string"
		Character       { String }, --   A character constant: 'c', '\n'
		-- Number			{ }, --   A number constant: 234, 0xff
		-- Boolean			{ }, --   A boolean constant: TRUE, false
		-- Float			{ }, --   A floating point constant: 2.3e10

		Identifier      { fg = DeadLeaf }, -- (*) Any variable name
		Function        { fg = SunsetMauve }, --   Function name (also: methods for classes)

		Statement       { fg = PumpkinOrange }, -- (*) Any statement
		--Conditional     { }, --   if, then, else, endif, switch, etc.
		--Repeat          { }, --   for, do, while, etc.
		--Label           { }, --   case, default, etc.
		Operator        { Normal }, --   "sizeof", "+", "*", etc.
		--Keyword         { }, --   any other keyword
		--Exception       { }, --   try, catch, throw

		PreProc        { fg = SunsetMauve }, -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type           { fg = SunsetGold }, -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special        { Operator }, -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		-- Delimiter      { }, --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		-- Error          { }, -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		sym"BufferCurrent" { fg = CumulousGray, bg = DarkHoney },
		sym"BufferCurrentERROR" { fg = BloodRed, bg = DarkHoney },
		sym"BufferCurrentHINT" { fg = CrispBlueSky, bg = DarkHoney },
		-- sym"BufferCurrentIcon" { },
		sym"BufferCurrentINFO" { fg = PumpkinOrange, bg = DarkHoney },
		sym"BufferCurrentWARN" { fg = SunsetGold, bg = DarkHoney },
		sym"BufferCurrentIndex" { fg = LingeringLeaf, bg = DarkHoney },
		sym"BufferCurrentMod" { fg = CrispBlueSky, bg = DarkHoney },
		sym"BufferCurrentSign" { fg = CumulousGray, bg = DarkHoney },
		sym"BufferCurrentTarget" { fg = White , bg = DarkHoney},

		sym'BufferVisible' { fg = OvercastGray, bg = DarkMud },
		sym'BufferVisibleERROR' { fg = SunsetRed, bg = DarkMud },
		sym'BufferVisibleHINT' { fg = HazyBlueSky, bg = DarkMud },
		-- sym'BufferVisibleIcon' { },
		sym'BufferVisibleINFO' { fg = Rust, bg = DarkMud },
		sym'BufferVisibleWARN' { fg = PumpkinOrange, bg = DarkMud },
		sym'BufferVisibleIndex' { fg =Evergreen, bg = DarkMud  },
		sym'BufferVisibleMod' { fg = HazyBlueSky, bg = DarkMud },
		sym'BufferVisibleSign' { fg = OvercastGray, bg = DarkMud },
		sym'BufferVisibleTarget' { fg = CumulousGray, bg = DarkMud },

		--[[
		sym'BufferAlternate' { bg = c.fg_gutter, fg = c.fg },
		sym'BufferAlternateERROR' { bg = c.fg_gutter, fg = c.error },
		sym'BufferAlternateHINT' { bg = c.fg_gutter, fg = c.hint },
		sym'BufferAlternateIcon' { bg = c.fg_gutter, fg = c. },
		sym'BufferAlternateIndex' { bg = c.fg_gutter, fg = c.info },
		sym'BufferAlternateINFO' { bg = c.fg_gutter, fg = c.info },
		sym'BufferAlternateMod' { bg = c.fg_gutter, fg = c.warning },
		sym'BufferAlternateSign' { bg = c.fg_gutter, fg = c.info },
		sym'BufferAlternateTarget' { bg = c.fg_gutter, fg = c.red },
		sym'BufferAlternateWARN' { bg = c.fg_gutter, fg = c.warning },
		]]

		sym'BufferInactive' { fg = OvercastGray, bg = DarkMud },
		sym'BufferInactiveERROR' { fg = SunsetRed, bg = DarkMud },
		sym'BufferInactiveHINT' { fg = HazyBlueSky, bg = DarkMud },
		-- sym'BufferInactiveIcon' { },
		sym'BufferInactiveINFO' { fg = Rust, bg = DarkMud },
		sym'BufferInactiveWARN' { fg = PumpkinOrange, bg = DarkMud },
		sym'BufferInactiveIndex' { fg = Evergreen, bg = DarkMud },
		sym'BufferInactiveMod' { fg = HazyBlueSky, bg = DarkMud },
		sym'BufferInactiveSign' { fg = OvercastGray, bg = DarkMud },
		sym'BufferInactiveTarget' { fg = CumulousGray, bg = DarkMud },

		sym'BufferOffset' { bg = DarkMud }, --bg = c.bg_statusline, fg = c.dark5 },
		sym'BufferTabpageFill' { bg = DarkMud }, -- bg = util.darken(c.bg_highlight, 0.8), fg = c.dark5 },
		sym'BufferTabpages' { bg = DarkMud }, -- bg = c.bg_statusline, fg = c.none },


		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		sym"@variable"          { fg = SunsetRed }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
