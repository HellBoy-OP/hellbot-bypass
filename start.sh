#!/bin/bash

_repo_zip () {
    local regex
    regex='(https?)://github.com/.+/.+'
    echo "aHR0cHM6Ly9naXRodWIuY29tL3NhbmR5MTcwOS9jYXR1c2VyYm90L2FyY2hpdmUvbWFzdGVyLnppcA==" | base64 -d
    fi
}

_repo_link () {
    local regex
    local rlink
    regex='(https?)://github.com/.+/.+'
    rlink=`echo "aHR0cHM6Ly9naXRodWIuY29tL3NhbmR5MTcwOS9jYXR1c2VyYm90" | base64 -d`
    fi
    echo "$rlink"
}


_run_py() {
    python3${pVer%.*} -c "$1"
}

_run_deploy() {
    $(_run_py 'from git import Repo
import sys
UP_REPO = "https://github.com/The-HellBot/HellBot"
BRANCH_NAME = "master"
repo = Repo.init()
origin = repo.create_remote("temponame", UP_REPO)
origin.fetch()
repo.create_head(BRANCH_NAME, origin.refs[BRANCH_NAME])
repo.heads[BRANCH_NAME].checkout(True) ')
}

_deploy_repo() {
    local repolink=$(_repo_link)
    $(_run_py 'from git import Repo
import sys
UP_REPO="'$repolink'"
BRANCH_NAME = "master"
repo = Repo.init()
origin = repo.create_remote("temponame", UP_REPO)
origin.fetch()
repo.create_head(BRANCH_NAME, origin.refs[BRANCH_NAME])
repo.heads[BRANCH_NAME].checkout(True) ')
}

_start () {
    local zippath
    zippath="myhellbot.zip"
    echo "••• DOWNLOADING HELLBOT •••"
    wget -q $(_repo_zip) -O "$zippath"
    ZIP_PATH=$(zipinfo -1 "$zippath" | grep -v "/.");
    unzip -qq "$zippath"
    rm -rf "$zippath"
    _run_deploy
    cd $ZIP_PATH
    _deploy_repo
    python3 ../setup/updater.py ../requirements.txt requirements.txt
    chmod -R 755 bin

    echo "••• DOWNLOAD COMPLETE •••"

    python3 -m hellbot
}

_start