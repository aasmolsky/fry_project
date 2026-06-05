Frai::MCP.define :gitlab do
  command "uv"
  args    ["--directory", "#{ENV['HOME']}/softswiss/gitlab-mcp", "run", "main.py"]
  env     GITLAB_URL: ENV["GITLAB_URL"],
          GITLAB_TOKEN: ENV["GITLAB_TOKEN"]
end
