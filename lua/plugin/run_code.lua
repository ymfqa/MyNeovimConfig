local M = {}

local vim = vim

local command = {
	["java"] = { "javac $filename.java -d ./classFile", "java -classpath ./classFile/ $filename" },
	["c"] = { "gcc -o $filename $filename.c", "./$filename" },
	["cpp"] = { "g++ -o $filename $filename.cpp", "./$filename" },
	["py"] = { "python $filename.py" },
	["go"] = { "go run $filename.go" },
	["js"] = { "node $filename.js" },
	["ts"] = { "node $filename.ts" },
	["rs"] = { "rustc $filename.rs", "./$filename" },
	["cs"] = { "csc.exe $filename.cs", "./$filename" },
	["lua"] = { "lua $filename.lua" },
	["vue"] = { "npm run dev" },
	["html"] = { "live-server" },
}

local extra_command = {
	["java"] = { "mvn spring-boot:run" },
	["py"] = { "pypy3 $filename.py" },
	["c"] = { "make" },
	["cpp"] = { "make" },
	-- ["vue"] = { "npm run tauri dev" },
	["vue"] = { "pnpm dev" },
}

function M.run_code_f(n)
	local filetype = vim.fn.expand("%:e")
	local fileplace = vim.fn.expand("%:p:h")
	local file = vim.fn.expand("%:t")
	local tmp, _ = string.find(string.reverse(file), ".", 1, true)
	local filename = string.sub(file, 1, tonumber("-" .. tostring(tmp + 1)))
	local cmd = { "cd " .. fileplace }
	--处理普通执行命令
	if n == "normal" and command[filetype] ~= nil then
		for i = 1, #command[filetype] do
			table.insert(cmd, (string.gsub(command[filetype][i], "$filename", filename)))
		end
	--处理其他特殊命令
	elseif n == "extra" and extra_command[filetype] ~= nil then
		for i = 1, #extra_command[filetype] do
			table.insert(cmd, (string.gsub(extra_command[filetype][i], "$filename", filename)))
		end
	else
		print("I don't know what's this...")
		return
	end

	vim.cmd("botright terminal")
	vim.cmd("startinsert!")

	local which_os = io.popen("uname"):read("*a")
	local isLinux = string.find(which_os, "Linux")
	if isLinux then --linux
		for i = 1, #cmd do
			vim.api.nvim_feedkeys(cmd[i] .. "\n", "t", true)
		end
	else --win(powershell)
		for i = 1, #cmd do
			vim.api.nvim_feedkeys(cmd[i] .. ";", "t", true)
		end
	end
end

function M.run_code(n)
	return function()
		M.run_code_f(n)
	end
end

return M
