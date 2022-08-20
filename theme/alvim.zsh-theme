# http://arthuralvim.com
# 26 Dec 2015 - arthuralvim
# Modified from ys.zsh-theme found in Oh-My-Zsh default themes.
# Works well with Git and Python (virtualenv) projects.

# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.

# PROMPT FORMAT:
#     user@host 00•00•0000 00:00:00 «branch:sha» ⚑
#     ‹virtualenv› [path/to/somewhere] $

# COLORS

ALV_USER_COLOR=%{$FG[040]%}
ALV_HOST_COLOR=%{$FG[033]%}
ALV_DATE_COLOR=%{$FG[036]%}
ALV_DATE_ICON_COLOR=%{$FG[208]%}
ALV_VIRTUALENV_COLOR=%{$FG[010]%}
ALV_VIRTUALENV_ICON_COLOR=%{$FG[208]%}

ALV_GIT_COLOR=%{$FG[012]%}
ALV_GIT_SHA_COLOR=%{$FG[012]%}
ALV_GIT_ICON_COLOR=%{$FG[208]%}
ALV_GIT_SEP_COLOR=%{$FG[208]%}

ALV_GIT_CLEAN_ICON_COLOR=%{$FG[040]%}
ALV_GIT_DIRTY_ICON_COLOR=%{$FG[124]%}

# ALV_GIT_ADDED_ICON_COLOR=%{$FG[040]%}
# ALV_GIT_DELETED_ICON_COLOR=%{$FG[040]%}
# ALV_GIT_MODIFIED_ICON_COLOR=%{$FG[040]%}
# ALV_GIT_RENAMED_ICON_COLOR=%{$FG[040]%}
# ALV_GIT_UNMERGED_ICON_COLOR=%{$FG[040]%}
# ALV_GIT_UNTRACKED_ICON_COLOR=%{$FG[040]%}

ALV_TIME_COLOR=%{$FG[036]%}
ALV_TIME_ICON_COLOR=%{$FG[208]%}
ALV_FOLDER_COLOR=%{$FG[226]%}
ALV_FOLDER_ICON_COLOR=%{$FG[226]%}
ALV_CURSOR_COLOR=%{$FG[243]%}
ALV_CURSOR_ICON_COLOR=%{$FG[239]%}
ALV_TEXT_COLOR=%{$FG[243]%}
ALV_BOLD=$terminfo[bold]
ALV_RESET=%{$reset_color%}

# ICONS

# Choose your icons here:
# http://www.utf8-chartable.de/

ALV_USER_ICON='$'
ALV_ROOT_ICON='#'

if [[ "$USER" == "root" ]]; then
    ALV_CURSOR_ICON=${ALV_ROOT_ICON};
else
    ALV_CURSOR_ICON=${ALV_USER_ICON};
fi

ALV_CURSOR_ICON_PREFIX=""
ALV_CURSOR_ICON_SUFFIX=" "
ALV_FOLDER_ICON_PREFIX="["
ALV_FOLDER_ICON_SUFFIX="] "
ALV_DATE_ICON_PREFIX="˓"
ALV_DATE_ICON_SUFFIX="˒ "
ALV_DATE_SEP_ICON="•"
ALV_TIME_ICON_PREFIX="˓"
ALV_TIME_ICON_SUFFIX="˒ "
ALV_TIME_SEP_ICON=":"
ALV_VIRTUALENV_ICON_PREFIX="‹"
ALV_VIRTUALENV_ICON_SUFFIX="› "
ALV_GIT_CLEAN_ICON='⚑'
ALV_GIT_DIRTY_ICON='⚑'
# ALV_GIT_ADDED_ICON='+'
# ALV_GIT_DELETED_ICON='-'
# ALV_GIT_MODIFIED_ICON='M'
# ALV_GIT_RENAMED_ICON='R'
# ALV_GIT_UNMERGED_ICON='U'
# ALV_GIT_UNTRACKED_ICON='?'
ALV_GIT_ICON_PREFIX="«"
ALV_GIT_ICON_SUFFIX="»"
ALV_GIT_SEP_ICON=":"

# PREFIXES AND SUFFIXES

ALV_USER_PREFIX=""
ALV_USER_SUFFIX=""
ALV_HOST_PREFIX="${ALV_TEXT_COLOR}@${ALV_RESET}"
ALV_HOST_SUFFIX=" "
ALV_DATE_PREFIX="${ALV_DATE_ICON_COLOR}${ALV_DATE_ICON_PREFIX}${ALV_RESET}"
ALV_DATE_SUFFIX="${ALV_DATE_ICON_COLOR}${ALV_DATE_ICON_SUFFIX}${ALV_RESET}"
ALV_DATE_SEPARATOR="${ALV_DATE_SEP_ICON}"
ALV_TIME_PREFIX="${ALV_TIME_ICON_COLOR}${ALV_TIME_ICON_PREFIX}${ALV_RESET}"
ALV_TIME_SUFFIX="${ALV_TIME_ICON_COLOR}${ALV_TIME_ICON_SUFFIX}${ALV_RESET}"
ALV_TIME_SEPARATOR="${ALV_TIME_SEP_ICON}"
ALV_FOLDER_PREFIX="${ALV_FOLDER_ICON_COLOR}${ALV_FOLDER_ICON_PREFIX}${ALV_RESET}"
ALV_FOLDER_SUFFIX="${ALV_FOLDER_ICON_COLOR}${ALV_FOLDER_ICON_SUFFIX}${ALV_RESET}"
ALV_CURSOR_PREFIX="${ALV_CURSOR_ICON_COLOR}${ALV_CURSOR_ICON_PREFIX}${ALV_RESET}"
ALV_CURSOR_SUFFIX="${ALV_CURSOR_ICON_COLOR}${ALV_CURSOR_ICON_SUFFIX}${ALV_RESET}"
ALV_VIRTUALENV_PREFIX="${ALV_VIRTUALENV_ICON_COLOR}${ALV_VIRTUALENV_ICON_PREFIX}${ALV_RESET}"
ALV_VIRTUALENV_SUFFIX="${ALV_VIRTUALENV_ICON_COLOR}${ALV_VIRTUALENV_ICON_SUFFIX}${ALV_RESET}"

ZSH_THEME_GIT_PROMPT_PREFIX="${ALV_GIT_ICON_COLOR}${ALV_GIT_ICON_PREFIX}${ALV_GIT_COLOR}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${ALV_RESET}"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="${ALV_GIT_SEP_COLOR}${ALV_GIT_SEP_ICON}${ALV_GIT_SHA_COLOR}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="${ALV_GIT_ICON_COLOR}${ALV_GIT_ICON_SUFFIX}${ALV_RESET}"

# format for git_prompt_status()

ZSH_THEME_GIT_PROMPT_DIRTY="${ALV_GIT_DIRTY_ICON_COLOR} ${ALV_GIT_DIRTY_ICON}${ALV_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN="${ALV_GIT_CLEAN_ICON_COLOR} ${ALV_GIT_CLEAN_ICON}${ALV_RESET}"
# ZSH_THEME_GIT_PROMPT_ADDED="${ALV_GIT_ADDED_ICON_COLOR} ${ALV_GIT_ADDED_ICON}${ALV_RESET}"
# ZSH_THEME_GIT_PROMPT_MODIFIED="${ALV_GIT_MODIFIED_ICON_COLOR} ${ALV_GIT_MODIFIED_ICON}${ALV_RESET}"
# ZSH_THEME_GIT_PROMPT_DELETED="${ALV_GIT_DELETED_ICON_COLOR} ${ALV_GIT_DELETED_ICON}${ALV_RESET}"
# ZSH_THEME_GIT_PROMPT_RENAMED="${ALV_GIT_RENAMED_ICON_COLOR} ${ALV_GIT_RENAMED_ICON}${ALV_RESET}"
# ZSH_THEME_GIT_PROMPT_UNMERGED="${ALV_GIT_UNMERGED_ICON_COLOR} ${ALV_GIT_UNMERGED_ICON}${ALV_RESET}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="${ALV_GIT_UNTRACKED_ICON_COLOR} ${ALV_GIT_UNTRACKED_ICON}${ALV_RESET}"

# FUNCTIONS

VIRTUAL_ENV_DISABLE_PROMPT=true

function preexec() {
  timer_start=$((rint(EPOCHREALTIME*1000)))
}

function precmd() {
  if [ $timer_start ]; then
    timer_finish=$((rint(EPOCHREALTIME*1000)))
    timer_elapsed=$((int(timer_finish - timer_start)))
    export RPROMPT="%F{cyan}${timer_elapsed} ms %{$reset_color%}"

    unset timer_start
    unset timer_finish
    unset timer_elapsed
  fi
}

function date_now {
    echo `date +"%d${ALV_DATE_SEPARATOR}%m${ALV_DATE_SEPARATOR}%Y"`
}

function time_now {
    echo `date +"%H${ALV_TIME_SEPARATOR}%M${ALV_TIME_SEPARATOR}%S"`
}

function host_name {
    [ -f ~/.host-name ] && cat ~/.host-name || echo ${SHORT_HOST:-$HOST}
}

function virtualenv_info() {
    [ $VIRTUAL_ENV ] && echo "${ALV_VIRTUALENV_PREFIX}${ALV_VIRTUALENV_COLOR}`basename $VIRTUAL_ENV`${ALV_RESET}${ALV_VIRTUALENV_SUFFIX}"
}

git_info_custom() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${cb}$(git_prompt_short_sha)${ZSH_THEME_GIT_PROMPT_SUFFIX}$(parse_git_dirty)"
    # echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${cb}$(git_prompt_short_sha)${ZSH_THEME_GIT_PROMPT_SUFFIX}$(parse_git_dirty)$(git_prompt_status)"
  fi
}

local user_info='${ALV_USER_COLOR}${USER}${ALV_RESET}'
local host_info='${ALV_HOST_COLOR}$(host_name)${ALV_RESET}'
local date_info='${ALV_DATE_COLOR}$(date_now)${ALV_RESET}'
local virtualenv_info='$(virtualenv_info)'
local time_info='${ALV_TIME_COLOR}$(time_now)${ALV_RESET}'
local folder_info='${ALV_FOLDER_COLOR}${PWD/#$HOME/~}${ALV_RESET}'
local cursor_info='${ALV_CURSOR_COLOR}${ALV_CURSOR_ICON}${ALV_RESET}'

local git_info='$(git_info_custom)'

### -----------------------------------------------------

# COMPOSITIONS

TOP_PROMPT_LEFT="\
${ALV_USER_PREFIX}${user_info}${ALV_USER_SUFFIX}\
${ALV_HOST_PREFIX}${host_info}${ALV_HOST_SUFFIX}\
${ALV_DATE_PREFIX}${date_info}${ALV_DATE_SUFFIX}\
${ALV_TIME_PREFIX}${time_info}${ALV_TIME_SUFFIX}\
${git_info}"

BOTTOM_PROMPT_LEFT="\
${virtualenv_info}\
${ALV_FOLDER_PREFIX}${folder_info}${ALV_FOLDER_SUFFIX}\
${ALV_CURSOR_PREFIX}${cursor_info}${ALV_CURSOR_SUFFIX}"

PROMPT="
${TOP_PROMPT_LEFT}\

${BOTTOM_PROMPT_LEFT}"