# A fix for stupid UNIX permissions

Simple docker container that looks for changes in file, and creates a copy with more open permissions. 
Example use case: You have a file that has root:root 600 permissions and the some app prevents You from making any changes to permissions (eg. Traefiks acme.json). You want to backup that file but backup job runs as "backup" user that has no access to our file, and for some case You don't want to run backup as root :) ACLs will not work in this case because reasons! 
Just run this container and You will always have an up to date copy of that file with more open permissions. The script will create a copy named "${filename}.back" with "root:root 644" permissions.

## Example docker-compose
- DEBUG: if true will print a message any time a change to file is detected and a copy has been made
- WATHCLIST: whitespace separated file list

```
  permission-bypass:
    image: cubix4/permission-bypass:latest
    restart: unless-stopped
    volumes:
      - ./some-dir:/some-dir
    environment:
      DEBUG: false
      WATCHLIST: "/some-dir/file1 /some-dir/file2 /some-dir/file3"
```
