# Git Command

Profile Config

`git config --global core.hooksPath .github/hooks`

short commit id

`git log -10 --pretty=format:"%h"`

log commit id

`git log -10 --pretty=format:"%H"`

show a file changed log

`git show $commit_id [filename]`

show git tag 
(but some tag is not real tag v0.0.1-1-gbc14d46d, regex `~ /.+-[0-9]+-g[0-9A-Fa-f]{6,}$/`)

`git describe --tags ${commit}`
