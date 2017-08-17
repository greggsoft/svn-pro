source .svn-project

branch=$2
if [ -z $branch ];then
  branch="trunk"
fi

case $1 in
  co )
    for project in $projects
    do
      if [ ! -d $project ]
      then
        svn co $repo/$project/$branch $project
      fi
    done
    ;;
  up )
    svn up $projects
    ;;
  st )
    svn st $projects
    ;;
  diff )
    svn diff $projects
    ;;
  sw )
    for project in $projects
    do
      svn ls ^/$project/$branch $project &> /dev/null && \
      echo "$project switch to $branch" && \
      svn switch ^/$project/$branch $project
    done
    ;;
  merge )
    for project in $projects
    do
      svn merge ^/$project/$branch $project
    done
    ;;
  branch )
    project=$2
    echo "$project at `svn info $project|grep -F 'Relative URL'|cut -d'/' -f3-4`"
    ;;
  branches )
    for project in $projects
    do
      if [ -d $project ]
      then
        echo "$project at `svn info $project|grep -F 'Relative URL'|cut -d'/' -f3-4`"
      fi
    done
    ;;
esac