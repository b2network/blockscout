set -x

probe() {
    # find *  -iname '*.md'
    files=$(find docker-compose/services -type f -iname '*.yml' | xargs -n 1)
    for item in $files; do
        # echo "---- $item ----"
        # yq '.services.[].image' $item
        yq '.services.[].ports' $item
        # yq '.services.[].command' $item
    done
}

$@
