set -x

workDir=$(pwd)

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

$@
