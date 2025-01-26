return {
	"iamcco/markdown-preview.nvim",
	init = function()
		-- if one of `SSH_TTY` or `SSH_CLIENT` is set, this is an ssh session
		if os.getenv("SSH_TTY") ~= nil or os.getenv("SSH_CLIENT") ~= nil then
			vim.g.mkdp_open_to_the_world = 1
			vim.g.mkdp_open_ip = "127.0.0.1"
			vim.g.mkdp_port = 8080
		end
	end,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function() vim.fn["mkdp#util#install"]() end,
}
