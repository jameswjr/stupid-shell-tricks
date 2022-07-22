d-helper() {
  if [ -z "${DIRSTACK[1]}" ] ; then
    return 1
  fi
  export CMD=$1
  str=`history 1 | perl -pe 's/^ *[0-9]+ +'$CMD'd/'$CMD'/g'| perl -pe 's{\#}{'${DIRSTACK[1]}'}g'`
  echo "$str"
  eval "$str"
}

cpd-helper() {
  d-helper "cp"
}	   
alias cpd='cpd-helper #'

lsd-helper() {
  d-helper "ls"
}
alias lsd='lsd-helper #'
