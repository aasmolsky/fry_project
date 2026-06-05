# Frai::MCP.define :jira do
#   desc "Jira - from mcp hub, require oauth"
#   url   ENV["JIRA_MCP_URL"]
#   oauth true
# end

Frai::MCP.define :jira do
  desc "Jira via local stdio MCP"
  command "uv"
  args    ["--directory", "#{ENV['HOME']}/softswiss/jira-mcp", "run", "main.py"]
  env     JIRA_URL:   ENV["JIRA_URL"],
          JIRA_TOKEN: ENV["JIRA_TOKEN"]
end

