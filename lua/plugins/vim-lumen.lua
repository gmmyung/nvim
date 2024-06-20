return {
	'vimpostor/vim-lumen',
	-- detect if this is a ssh session or not
	cond = function()
		-- if one of `SSH_TTY` or `SSH_CLIENT` is set, this is an ssh session
		-- returns false if it is an ssh session
		return os.getenv("SSH_TTY") == nil and os.getenv("SSH_CLIENT") == nil
	end,
}
