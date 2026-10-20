# Fish autoloads a function only when its file name matches. log, debug, warn,
# error, fatal, and critical are all defined in functions/logger.fish, so load
# that file when the shell starts.
source (dirname (status -f))/../functions/logger.fish
