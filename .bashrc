# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export VISUAL=vim
export EDITOR=vim

# my custom Alias
alias st='hg status'
alias ab='arc bookmark'
alias fsa='adb shell am start -n com.facebook.wakizashi/com.facebook.payments.sample.PaymentsFlowSampleActivity'
alias msa='adb shell am start -n com.facebook.orca/com.facebook.payments.sample.PaymentsFlowSampleActivity'
alias psa='adb shell am start -n com.facebook.pages.app/com.facebook.payments.sample.PaymentsFlowSampleActivity'

# android code base
alias jpt='buck test javatests/com/facebook/payments/ && done'
alias ipt='buck build instrumentation_tests/com/facebook/payments:payments  && done'
alias ipts='./instrumentation_tests/run instrumentation_tests/com/facebook/payments:payments --screenshots  && done'

# test coverage
alias jptc=' buck test -v 2 --code-coverage  javatests/com/facebook/payments/  && done'
alias iptc='./instrumentation_tests/run --code-coverage //instrumentation_tests/com/facebook/payments/  && done'

# Android

alias bfb='buck build fb4a && done'
alias ifb='buck install fb4a -r  && done'
alias ipg='buck install pages -r  && done'
alias ims='buck install messenger -r && done'

# iOS
alias ifbi='buck install --run fbios'
alias imsi='buck install --run messenger'

# Colors for bash prompt
txtcyn='\[\033[1;36m\]' # Cyan
txtred='\[\033[1;31m\]' # Red
txtylw='\[\033[1;33m\]' # Yellow
txtrst='\[\033[0m\]'    # Text Reset

# Mercurial
alias uncommit='hg strip --keep -r .'

__setup_ps1 () {
  GIT_ACTIVE_BRANCH1=$(hg bookmark 2>/dev/null | grep '*' | cut -d ' ' -f 3)
  test -z "$GIT_ACTIVE_BRANCH1" || GIT_ACTIVE_BRANCH1="${txtcyn}${GIT_ACTIVE_BRANCH1} ${txtrst}"
  PS1="$GIT_ACTIVE_BRANCH1${txtred}\u${txtrst}${txtylw}\w${txtrst}$ "
}

PROMPT_COMMAND='__setup_ps1'

alias done='osascript -e '"'"'display notification "Go back to termianl!" with title "Task Done"'"'"''

alias myfbid="echo 10151984632552183 | pbcopy"

alias myid="echo 675217182 | pbcopy"

alias fps='./scripts/open_url  fb://payment_settings'
