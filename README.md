# SVN Projects

Add links:

    ln -sf `readlink -f svn-pro.sh` ~/bin/svn-pro
    ln -sf `readlink -f svn-add.sh` ~/bin/svn-add

## Usage

Add `.svn-project` file with:

    repo="svn://example.com/svn"
    projects="one two three"

then checkout all projects from svn:

    svn-pro co

Or with something branch:

    svn-pro co branch/dev

Show status:

    svn-pro status

Show branches:

    svn-pro branches

Updates all:

    svn-pro up

Switch to branch:

    svn-pro sw branch/new
