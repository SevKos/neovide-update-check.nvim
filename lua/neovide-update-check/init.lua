local M = {}

M.config = {
	keymap = "<leader>pn",
}
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	if vim.g.neovide and M.config.keymap then
		vim.keymap.set("n", M.config.keymap, M.check_update, {
			desc = "Check Neovide for updates",
		})
	end
end

function M.check_update()
	if not vim.g.neovide then
		return
	end

	vim.notify("Checking Neovide version")

	local current = vim.g.neovide_version

	vim.system({
		"curl",
		"-s",
		"https://api.github.com/repos/neovide/neovide/releases/latest",
	}, {}, function(result)
		if result.code ~= 0 then
			return
		end

		local data = vim.json.decode(result.stdout)
		local latest = data.tag_name

		if latest ~= current then
			vim.notify("Neovide update available: " .. current .. " → " .. latest, vim.log.levels.INFO)
		else
			vim.notify("You have the latest version: " .. current, vim.log.levels.INFO)
		end
	end)
end

return M
