declare cachedir="$(cd "${ZDOTDIR}/.." && pwd)/.cache/zsh"
declare -A ZINIT=(
  [HOME_DIR]="${cachedir}/zinit"
  [BIN_DIR]="${cachedir}/zinit/bin"
  [COMPLETIONS_DIR]="${cachedir}/zinit/completions"
  [PLUGINS_DIR]="${cachedir}/zinit/plugins"
  [SNIPPETS_DIR]="${cachedir}/zinit/snippets"
  [ZCOMPDUMP_PATH]="${cachedir}/.zcompdump"
)
declare ZPFX="${cachedir}/zinit/polaris"

. "${cachedir}/zinit/bin/zinit.zsh"
autoload -Uz _zinit
((${+_comps}))&&_comps[zinit]=_zinit

zinit ice depth=1;zinit light romkatv/powerlevel10k
zinit light zdharma/fast-syntax-highlighting

. "${ZDOTDIR}/.p10k.zsh"
