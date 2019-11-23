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


## 一、如何使用github
https://guides.github.com/activities/hello-world/

## 二、如何进行PR
https://help.github.com/articles/creating-a-pull-request/

## 三、创建组织 or Team
https://github.com/organizations/new

## 四、创建个人博客
https://pages.github.com/
1.  dns cname
2.  repo create CNAME file

docker jekyll/jekyll


## 五、github webhook
https://github.com/adnanh/webhook
1. 主要是用于做自动化部署
2. 工作量衡量变更监控
需要注意的是 id 就是请求链接，需请求地址是example.com/hooks/howto, 则id为 hooks.json 中id对应的值为 howto,  一个json文件可以支持多个webhook
