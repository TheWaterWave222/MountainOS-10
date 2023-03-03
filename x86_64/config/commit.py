import subprocess

# Get commit message
msg = input("Commit message: ")

# Commit changes
commit = "git add -A && git commit -m \"" + msg + "\""

# Publish changes
publish = "git push"

# Run commands
subprocess.run(commit, shell = True)
subprocess.run(publish, shell = True)