local M = {}

local vim = vim

local command = {
	["java"] = { "java $filename.java"},
	["c"] = { "gcc -o $filename $filename.c", "./$filename" },
	["cpp"] = { "g++ -o $filename $filename.cpp", "./$filename" },
	["py"] = { "python $filename.py" },
	["go"] = { "go run $filename.go" },
	["js"] = { "node $filename.js" },
	["ts"] = { "node $filename.ts" },
	["dart"] = { "dart $filename.dart" },
	["rs"] = { "rustc $filename.rs", "./$filename" },
	["cs"] = { "csc.exe $filename.cs", "./$filename" },
	["scss"] = { "sass $filename.scss $filename.css" },
	["sh"] = { "./$filename.sh" },
	["lua"] = { "lua $filename.lua" },
	["vue"] = { "npm run dev" },
	["jsonc"] = { "waybar" },
	["html"] = { "live-server -H 127.0.0.1 -p 12138" },
	["qml"] = { "quickshell" },
}

local extra_command = {
	["xml"] = { "mvn spring-boot:run" },
	["java"] = { "javac $filename.java -d ./classFile", "java -classpath ./classFile/ $filename" },
	-- ["py"] = { "pypy3 $filename.py" },
	["py"] = { "uv run $filename.py" },
	["js"] = { "javascript-obfuscator $filename.js --output output_$filename.js --dead-code-injection true" },
	["c"] = { "make" },
	["cpp"] = { "make" },
	["dart"] = { "flutter run" },
	["go"] = { "swag fmt", "swag init", "go run $filename.go" },
	-- ["vue"] = { "npm run tauri dev" },
	["vue"] = { "pnpm dev" },
	["html"] = { "npx serve" },
}

function M.run_code_f(n)
	local filetype = vim.fn.expand("%:e")
	local fileplace = vim.fn.expand("%:p:h")
	local file = vim.fn.expand("%:t")
	local tmp, _ = string.find(string.reverse(file), ".", 1, true)
	local filename = string.sub(file, 1, tonumber("-" .. tostring(tmp + 1)))
	-- local filename = "'" .. string.sub(file, 1, tonumber("-" .. tostring(tmp + 1))) .. "'"
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
		print("我不认识这个文件类型...")
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
