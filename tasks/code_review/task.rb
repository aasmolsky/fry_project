# CodeReviewTask — single LLM call.
#
# Entry point: tasks/code_review/directives/main.md.erb
#
# Minimal — accepts any input:
#
#   class CodeReviewTask < BaseTask
#   end
#
#   CodeReviewTask.call("some text")
#
# With params validation:
#
#   class CodeReviewTask < BaseTask
#     directive :main do
#       params do
#         required :name,     String   # Frai::MissingParam if absent
#         optional :lang,     String, default: "en"
#       end
#     end
#   end
#
#   CodeReviewTask.call(name: "item")
#
# With constants, sub-directives and scripts:
#
#   class CodeReviewTask < BaseTask
#     const :threshold, 10
#
#     directive :main do
#       params do
#         required :query, String
#       end
#       directive :analyze do
#         script :fetch_data do
#           input   String
#           returns data: String
#         end
#       end
#     end
#   end
#
# Run:
#   frai exec CodeReviewTask
#   frai exec CodeReviewTask "your input"
class CodeReviewTask < BaseTask
  mcp :jira
  mcp :gitlab

  directive :main do
    params do
      required :task_id, String
    end

    use :code_style_guides

    run :analyze_diff do
      input   String
      returns metrics: String
    end
  end
end
