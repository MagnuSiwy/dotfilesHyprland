return {
    {
    	"neanias/everforest-nvim",
            version = false,
            lazy = false,
            priority = 1000,
    	config = function()
    	    vim.cmd.colorscheme "everforest"
	        require("everforest").setup({
    		background = "hard"
	        })
	    end,
    },
    {
	    'nvim-lualine/lualine.nvim',
        dependencies = { 
            'nvim-tree/nvim-web-devicons' 
        },
    	opts = {
	        theme = 'everforest'
    	},
    },
}
