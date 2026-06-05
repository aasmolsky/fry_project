# desc: Analyzes the diff metrics for the MR

import sys
import json
import hashlib

data = json.load(sys.stdin)
task_id = data["input"]

h = int(hashlib.md5(task_id.encode(), usedforsecurity=False).hexdigest(), 16)

files_changed = (h % 8) + 1
lines_added   = (h >> 4) % 150 + 10
lines_removed = (h >> 8) % 80 + 5
complexity    = ["low", "medium", "high"][h % 3]

metrics = (
    f"- Files changed: {files_changed}\n"
    f"- Lines added: {lines_added}\n"
    f"- Lines removed: {lines_removed}\n"
    f"- Complexity: {complexity}"
)

print(json.dumps({"metrics": metrics}))