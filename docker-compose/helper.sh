set -x

workDir=$(pwd)
# shopt -s expand_aliases

# alias dc='docker-compose --env-file .env.l1'
# alias dc='docker-compose --env-file .env.l2'

startL1L2() {
    docker-compose --env-file .env.l1 up -d
    sleep 10s
    docker-compose --env-file .env.l2 up -d
}

stopL1L2() {
    docker-compose --env-file .env.l1 down -v
    docker-compose --env-file .env.l2 down -v
}

restartL1L2() {
    stopL1L2
    startL1L2
}

debug() {
    for item in .env.l1 .env.l2; do
        # docker-compose --env-file $item ps -a
        newName=tmp-${item/.env./}-docker-compose-allinone.yml
        docker-compose --env-file $item config >$newName
    done
    return
    docker-compose --env-file .env.l1 logs backend
    docker-compose --env-file .env.l2 logs backend >tmp2.log
    return
    svs=$(dc ps --services | xargs)
    for item in $svs; do
        dc exec -it $item date
        # dc exec -it $item env
        # dc exec -it $item cat /etc/os-release
    done
    return
}

ymlDiff() {
    # cd $workDir/L1
    # find . -iname '*.yml'  | xargs sha1sum > ../L1.sha1
    # cd $workDir/L2
    # find . -iname '*.yml'  | xargs sha1sum > ../L2.sha1
    # find L1/ L2 -iname 'docker-compose-backend.yml' | xargs icdiff
    return
}

envDiff() {
    # cd $workDir/L1
    # find . -iname '*.env'  | xargs sha1sum > ../tmp-L1.env
    # cd $workDir/L2
    # find . -iname '*.env'  | xargs sha1sum > ../tmp-L2.env
    # find L1/ L2 -iname 'common-blockscout-public-test.env' | xargs icdiff
    # find L1/ L2 -iname 'common-frontend-public-test.env' | xargs icdiff

    # find envs/ L2 -iname 'common-blockscout-public-test.env' | xargs icdiff
    # find envs/ L2 -iname 'common-frontend-public-test.env' | xargs icdiff

    find envs/ L1 -iname 'common-blockscout-public-test.env' | xargs icdiff
    find envs/ L1 -iname 'common-frontend-public-test.env' | xargs icdiff
    return
}

show() {
    # browsh http://127.0.0.1:30000
    browsh http://127.0.0.1:30001
}
$@
