#!/bin/bash
kali-shell() {
    container_name=$(
        docker container list \
            --filter "ancestor=security-kali-linux" \
            --filter "status=running" \
            --format '{{.Names}}'
    )

    if [ -z "$container_name" ]; then
        echo "No running container found with the specified image."
        return 1
    fi

    docker exec --interactive --tty "$container_name" /bin/bash
}
