# $FreeBSD: releng/10.1/etc/root/dot.cshrc 243893 2012-12-05 13:56:39Z eadler $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

source ~/.cshalias

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	vi
setenv	PAGER		"/usr/bin/less -erX"
setenv	BLOCKSIZE	K

setenv	RED			"%{\033[0;31m%}"
setenv	GREEN		"%{\033[0;32m%}"
setenv	YELLOW	"%{\033[0;33m%}"
setenv	BLUE		"%{\033[0;34m%}"
setenv	PURPLE	"%{\033[0;35m%}"
setenv	CYAN		"%{\033[0;36m%}"
setenv	WHITE		"%{\033[0;37m%}"
setenv	BOLD		""
setenv	RESET		"%{\033[0m%}"
setenv	ROOTC		"%{\033[0;32m%}"

if ( ! $?MANPATH ) then
	setenv MANPATH /usr/local/man:/usr/man:/usr/share/man:/usr/X11R6/man
else
	setenv MANPATH /usr/local/man:/usr/man:/usr/share/man:/usr/X11R6/man:$MANPATH
endif

if ($?prompt) then
	if ($uid == 0) then
		set user = root
		setenv ROOTC "%{\033[41;37m%}"
	endif
	# An interactive shell -- set some stuff up
	set prompt = "%b${PURPLE}%Y-%W-%D %P %?"'\n'"${ROOTC}%n${CYAN} %m ${YELLOW}%/"'\n'"${PURPLE}%#${RESET} "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
		bindkey "\e[1~" beginning-of-line # Home
		bindkey "\e[7~" beginning-of-line # Home rxvt
		bindkey "\e[2~" overwrite-mode # Ins
		bindkey "\e[3~" delete-char # Delete
		bindkey "\e[4~" end-of-line # End
		bindkey "\e[8~" end-of-line # End rxvt
	endif

endif
