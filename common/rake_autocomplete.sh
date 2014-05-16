# bash completion for rake
#
# some code from on Jonathan Palardy's http://technotales.wordpress.com/2009/09/18/rake-completion-cache/
# and http://pastie.org/217324 found http://ragonrails.com/post/38905212/rake-bash-completion-ftw
# 
# For details and discussion
# http://turadg.aleahmad.net/2011/02/bash-completion-for-rake-tasks/
#
# INSTALL
#
# Place in your bash completions.d and/or source in your .bash_profile
# If on a Mac with Homebrew, try "brew install bash-completion"
# 
# USAGE
#
# Type 'rake' and hit tab twice to get completions.
# To clear the cache, run rake_cache_clear() in your shell.
#

upsearch () {
    up_to=$1
    curdir=`pwd`
    result=1

    while [[ "`pwd`" != "$up_to" && "`pwd`" != '/' ]]; do
        if [[ -f Rakefile  ]]; then
            result=0
            rake_root=$(pwd)
            break
        fi
        cd ..
    done
    cd $curdir
    return $result
}

function _rake_cache_path() {
  # If a tmp directory exists, put the cache in the tmp dir
  # so version control ignores it
  if [ -e "${rake_root}/tmp" ]; then
    prefix='tmp/'
  fi
  echo "${rake_root}/${prefix}.rake_t_cache"
}

function rake_cache_store() {
  rake --tasks --silent > "$(_rake_cache_path)"
}

function rake_cache_clear() {
  rm -f .rake_t_cache
  rm -f tmp/cache/.rake_t_cache
}

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

function _rakecomplete() {
  # error if no Rakefile
  if upsearch; then
    :
  else
    echo "NO RAKEFILE"
    return 1
  fi

  # build cache if missing
  if [ ! -e "$(_rake_cache_path)" ]; then
    rake_cache_store
  fi

  local tasks=`awk '{print $2}' "$(_rake_cache_path)"`
  COMPREPLY=($(compgen -W "${tasks}" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _rakecomplete rake
