return {

	-- ONEDARK

	"navarasu/onedark.nvim",
	priority = 1000,

	opts = {

		-- Main options --
		style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

		-- toggle theme style ---
		toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "none",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
			-- variables = 'italic'
		},

		-- Lualine options --
		lualine = {
			transparent = false, -- lualine center bar transparency
		},

		-- Custom Highlights --
		colors = {}, -- Override default colors

		highlights = {

			CursorLine = { fg = nil, bg = "#2C313C" },
			CursorLineNr = { fg = "#61AFEF", bg = "#2C313C" },
			CursorLineSign = { fg = nil, bg = "#2C313C" },
			CursorLineFold = { fg = nil, bg = "#2C313C" },
			-- CursorLineFold = { fg = "#E0AF68", bg = "#2C313C" },
			Folded = { fg = "#282C34", bg = "#E0AF68" },
			FoldColumn = { fg = "#515E6F", bg = "#282C34" },
			SignColumn = { fg = nil, bg = "#282C34" },
			VertSplit = { fg = "#3E4452", bg = "#282C34" },
			Search = { fg = "#21252B", bg = "#C678DD" },
			IncSearch = { fg = "#21252B", bg = "#E06C75" },

			BufferLineIndicatorVisible = { fg = "#21252B", bg = "#21252B" },
			BufferLineOffsetSeparator = { fg = "#21252B", bg = "#21252B" },

			NeoTreeNormal = { fg = nil, bg = "#21252B" },
			NeoTreeNormalNC = { fg = nil, bg = "#21252B" },
			NeoTreeRootName = { fg = "#E06C75", bg = nil },
			NeoTreeDotfile = { fg = "#5A5E64", bg = nil },
			NeoTreeVertSplit = { fg = "#21252B", bg = "#21252B" },
			NeoTreeStatusLin = { fg = "#21252B", bg = "#21252B" },
			NeoTreeStatusLine = { fg = nil, bg = "#21252B" },
			NeoTreeSignColumn = { fg = "#21252B", bg = "#21252B" },
			NeoTreeEndOfBuffer = { fg = "#21252B", bg = "#21252B" },
			NeoTreeStatusLineNC = { fg = "#21252B", bg = "#21252B" },
			NeoTreeWinSeparator = { fg = "#21252B", bg = "#21252B" },
			NeoTreeExpander = { fg = "#4D5A5E", bg = nil },
			NeoTreeIndentMarker = { fg = "#3A4646", bg = nil },
			NeoTreeDirectoryName = { fg = "#ABB2BF", bg = nil },
			-- NeoTreeGitAdded            = { fg = "#5C6370" , bg = nil       },
			NeoTreeGitConflict         = { fg = "#21252B" , bg = "#E86671"       },
			-- NeoTreeGitDeleted          = { fg = "#5C6370" , bg = nil       },
			-- NeoTreeGitIgnored          = { fg = "#5C6370" , bg = nil       },
			-- NeoTreeGitModified         = { fg = "#5C6370" , bg = nil       },
			-- NeoTreeGitRenamed          = { fg = "#5C6370" , bg = nil       },
			-- NeoTreeGitStaged           = { fg = "#5C6370" , bg = nil       },
			NeoTreeGitUntracked        = { fg = "#21252B" , bg = "#E86671"       },

			TSRainbowRed = { fg = "#E06C75", bg = nil },
			TSRainbowYellow = { fg = "#E5C07B", bg = nil },
			TSRainbowBlue = { fg = "#61AFEF", bg = nil },
			TSRainbowOrange = { fg = "#EBD09C", bg = nil },
			TSRainbowGreen = { fg = "#98C379", bg = nil },
			TSRainbowViolet = { fg = "#C678DD", bg = nil },
			TSRainbowCyan = { fg = "#56B6C2", bg = nil },

			-- General
			DashboardHeader = { fg = "#81A1C1", bg = nil },
			DashboardFooter = { fg = "#5E768E", bg = nil, fmt = "bold" },
			-- Hyper theme
			DashboardProjectTitle = { fg = "#56B6C2", bg = nil },
			DashboardProjectTitleIcon = { fg = "#56B6C2", bg = nil },
			DashboardProjectIcon = { fg = "#61AFEF", bg = nil },
			DashboardMruTitle = { fg = "#56B6C2", bg = nil },
			DashboardMruIcon = { fg = "#61AFEF", bg = nil },
			DashboardFiles = { fg = "#ABB2BF", bg = nil },
			DashboardShotCutIcon = { fg = "#56B6C2", bg = nil },

			-- 设置选择器中选定项目的突出显示
			TelescopeSelection = { fg = nil, bg = "#3E4552" },
			TelescopeSelectionCaret = { fg = "#61AFEF", bg = nil },
			TelescopeMultiSelection = { fg = "#E06C75", bg = nil },
			TelescopeMultiIcon = { fg = "#E06C75", bg = nil },

			-- 边框高亮组
			TelescopeBorder = { fg = "#646870", bg = nil },
			TelescopePromptBorder = { fg = "#646870", bg = nil },
			TelescopeResultsBorder = { fg = "#646870", bg = nil },
			TelescopePreviewBorder = { fg = "#646870", bg = nil },
			-- 用于突出显示您匹配的字符。
			TelescopeMatching = { fg = "#E06C75", bg = nil },

			DiagnosticVirtualTextHint = { fg = "#C678DD", bg = "#3B3F4C" },
			DiagnosticVirtualTextInfo = { fg = "#56B6C2", bg = "#3B3F4C" },
			DiagnosticVirtualTextWarn = { fg = "#E0AF68", bg = "#3B3F4C" },
			DiagnosticVirtualTextError = { fg = "#E06C6A", bg = "#3B3F4C" },

			CmPmenu = { fg = nil, bg = "#20242D" },
			CMPPmenu = { fg = nil, bg = "#20242D" },

			CmpBorder = { fg = "#20242D", bg = "#20242D" },
			CmpDocBorder = { fg = "#20242D", bg = "#20242D" },

			CMPPmenuSel = { fg = "#FFFFFF", bg = "#61AFEF" },
			CmpItemAbbrDeprecated = { fg = "#61AFEF", bg = nil },

			CmpItemAbbr = { fg = "#ABB2BF", bg = nil },
			CmpItemAbbrMatch = { fg = "#C678DD", bg = nil },

			CmpItemKindConstant = { fg = "#d19a66", bg = nil },
			CmpItemKindFunction = { fg = "#61afef", bg = nil },
			CmpItemKindIdentifier = { fg = "#e06c75", bg = nil },
			CmpItemKindField = { fg = "#e06c75", bg = nil },
			CmpItemKindVariable = { fg = "#c678dd", bg = nil },
			CmpItemKindSnippet = { fg = "#e06c75", bg = nil },
			CmpItemKindText = { fg = "#98c379", bg = nil },
			CmpItemKindStructure = { fg = "#c678dd", bg = nil },
			CmpItemKindType = { fg = "#e5c07b", bg = nil },
			CmpItemKindKeyword = { fg = "#c8ccd4", bg = nil },
			CmpItemKindMethod = { fg = "#61afef", bg = nil },
			CmpItemKindConstructor = { fg = "#61afef", bg = nil },
			CmpItemKindFolder = { fg = "#c8ccd4", bg = nil },
			CmpItemKindModule = { fg = "#e5c07b", bg = nil },
			CmpItemKindProperty = { fg = "#e06c75", bg = nil },
			CmpItemKindUnit = { fg = "#c678dd", bg = nil },
			CmpItemKindFile = { fg = "#c8ccd4", bg = nil },
			CmpItemKindColor = { fg = "#e06c75", bg = nil },
			CmpItemKindReference = { fg = "#abb2bf", bg = nil },
			CmpItemKindStruct = { fg = "#c678dd", bg = nil },
			CmpItemKindOperator = { fg = "#abb2bf", bg = nil },
			CmpItemKindTypeParameter = { fg = "#e06c75", bg = nil },


            IndentBlanklineContextStart = {fg = nil, bg="#3E4452" },


		},

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	},

	config = function(_, opts)
		require("onedark").setup(opts)
		require("onedark").load()
	end,
}
