return {
 {
  'nvim-telescope/telescope.nvim', tag = '-1.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' }
 },
 {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
 {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
   "nvim-lua/plenary.nvim",
   "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
   "MunifTanjim/nui.nvim",
   -- "2rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
 },

}
