local cmd_base = "git clone "
local acc_uname = "baris-inandi"
local cmd

if not arg[1] or string.sub(arg[1], 1, 1) == "-" then
  print("Usage:")
  print("  gitclone <url>")
  print("  gitclone <repo>")
  print("  gitclone <user/repo>")
  os.exit(0)
end
if string.find(arg[1], "://") then
  -- Is a URL
  -- directly clone it
  cmd = cmd_base .. arg[1]
elseif string.find(arg[1], "/") then
  -- is a user/repo
  -- clone it from github
  cmd = cmd_base .. "https://github.com/" .. arg[1]
else
  -- is just a repo name
  -- clone from personal account
  cmd = cmd_base .. "https://github.com/" .. acc_uname .. "/" .. arg[1]
end

print(cmd)
os.execute(cmd)
