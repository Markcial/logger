<div align="center">

# 📜 logger

**Empower your log capabilities to the maximum level. Colored, leveled logging for the [fish shell](https://fishshell.com).**

[![License: MIT](https://img.shields.io/github/license/Markcial/logger)](LICENSE)
![fish shell](https://img.shields.io/badge/fish-shell-4AAE46)
[![GitHub stars](https://img.shields.io/github/stars/Markcial/logger?style=social)](https://github.com/Markcial/logger/stargazers)

<!-- TODO(Marc): add a terminal screenshot of the five levels in color (e.g. docs/levels.png). -->

</div>

## ✨ Features

- 🎚️ **Five severities**, each with its own colors: DEBUG, WARN, ERROR, FATAL, CRITICAL
- 🕒 Every line carries the **level, the date and your message**
- ⚡ **Short aliases**: `debug`, `warn`, `error`, `fatal`, `critical`
- 🎨 Colors rendered with [cprintf](https://github.com/Markcial/cprintf)

## 📦 Install

With [Fisher] 4:

```fish
fisher install markcial/cprintf markcial/logger
```

[cprintf](https://github.com/Markcial/cprintf) is required. Fisher 4 does not install dependencies listed in `fishfile`, so install it in the same command.

## 🚀 Usage

```fish
log foo
debug foo     # or log foo 1
warn foo      # or log foo 2
error foo     # or log foo 3
fatal foo     # or log foo 4
critical foo  # or log foo 5
```

| Level | Function | `log` shorthand |
|---|---|---|
| 🔵 DEBUG | `debug` | `log <msg>` / `log <msg> 1` |
| 🟡 WARN | `warn` | `log <msg> 2` |
| 🟠 ERROR | `error` | `log <msg> 3` |
| 🔴 FATAL | `fatal` | `log <msg> 4` |
| 🚨 CRITICAL | `critical` | `log <msg> 5` |

## 📄 License

[MIT](LICENSE)

[Fisher]: https://github.com/jorgebucaran/fisher

---

<div align="center">

Made by **Marc Garcia** · [marcgarcia.dev](https://marcgarcia.dev) · [@_marc_garcia on X](https://x.com/_marc_garcia) · [GitHub](https://github.com/Markcial)

</div>
