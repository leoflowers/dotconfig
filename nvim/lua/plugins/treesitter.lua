return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
	config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { 
			  "c", 
			  "cpp", 
			  "lua", 
			  "vim", 
			  "python",
			  "rust",
			  "terraform",
			  "hcl",
		  },
          highlight = { enable = true },
        })
    end
 }}
