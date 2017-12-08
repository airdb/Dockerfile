FROM  airdb/alpine
MAINTAINER  Dean <Dean@airdb.com>

# Build image: 
# docker build . --rm -t airdb/alpine-nginx -f  nginx.dockerfile
# Run Container:
# docker run -d --name access airdb/alpine-toolbox

# Step 1: List service infomation and choose stable version.
# ENV SERVICE go
# ENV VERSION 1.9.2
# ENV SERVICE_PKG $SERVICE$VERSION.linux-amd64.tar.gz
#wget https://redirector.gvt1.com/edgedl/go/go1.4.linux-amd64.tar.gz

#ENV LANG en_US.UTF-8
#ENV PS1 "[\u@\H.airdb.io \W]\$ "
#ENV HOMEDIR /srv
# WORKDIR $HOMEDIR
#ENV GOPATH /srv \
ENV UHOME /root

# bash \
# openssh \
#    mysql-client \
#    vim \
#    ca-certificates \
#    wget \
RUN apk add --no-cache --virtual .build-deps vim curl git

# Plugins && Theme
RUN mkdir -p $UHOME/bundle \
    && cd $UHOME/bundle/ \
    && git clone --depth 1 https://github.com/VundleVim/Vundle.vim \
    && git clone --depth 1 https://github.com/altercation/vim-colors-solarized \
    && git clone --depth 1 https://github.com/pangloss/vim-javascript \
    && git clone --depth 1 https://github.com/scrooloose/nerdcommenter \
    && git clone --depth 1 https://github.com/godlygeek/tabular \
    && git clone --depth 1 https://github.com/Raimondi/delimitMate \
    && git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides \
    && git clone --depth 1 https://github.com/groenewege/vim-less \
    && git clone --depth 1 https://github.com/othree/html5.vim \
    && git clone --depth 1 https://github.com/elzr/vim-json \
    && git clone --depth 1 https://github.com/bling/vim-airline \
    && git clone --depth 1 https://github.com/easymotion/vim-easymotion \
    && git clone --depth 1 https://github.com/mbbill/undotree \
    && git clone --depth 1 https://github.com/majutsushi/tagbar \
    && git clone --depth 1 https://github.com/vim-scripts/EasyGrep \
    && git clone --depth 1 https://github.com/jlanzarotta/bufexplorer \
    && git clone --depth 1 https://github.com/kien/ctrlp.vim \
    && git clone --depth 1 https://github.com/scrooloose/nerdtree \
    && git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs \
    && git clone --depth 1 https://github.com/scrooloose/syntastic \
    && git clone --depth 1 https://github.com/tomtom/tlib_vim \
    && git clone --depth 1 https://github.com/marcweber/vim-addon-mw-utils \
    && git clone --depth 1 https://github.com/vim-scripts/taglist.vim \
    && git clone --depth 1 https://github.com/terryma/vim-expand-region \
    && git clone --depth 1 https://github.com/tpope/vim-fugitive \
    && git clone --depth 1 https://github.com/airblade/vim-gitgutter \
    && git clone --depth 1 https://github.com/fatih/vim-go \
    && git clone --depth 1 https://github.com/plasticboy/vim-markdown \
    && git clone --depth 1 https://github.com/michaeljsmith/vim-indent-object \
    && git clone --depth 1 https://github.com/terryma/vim-multiple-cursors \
    && git clone --depth 1 https://github.com/tpope/vim-repeat \
    && git clone --depth 1 https://github.com/tpope/vim-surround \
    && git clone --depth 1 https://github.com/vim-scripts/mru.vim \
    && git clone --depth 1 https://github.com/vim-scripts/YankRing.vim \
    && git clone --depth 1 https://github.com/tpope/vim-haml \
    && git clone --depth 1 https://github.com/SirVer/ultisnips \
    && git clone --depth 1 https://github.com/honza/vim-snippets \
    && git clone --depth 1 https://github.com/derekwyatt/vim-scala \
    && git clone --depth 1 https://github.com/christoomey/vim-tmux-navigator \
    && git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim 

# Build default .vimrc
RUN curl -s https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim  >> $UHOME/.vimrc \
    && curl -s https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/extended.vim >> $UHOME/.vimrc \
    && echo "set nocompatible" >> $UHOME/.vimrc \
    && echo "filetype off" >> $UHOME/.vimrc \
    && echo "set rtp+=~/bundle/Vundle.vim" >> $UHOME/.vimrc \
    && echo "call vundle#begin()" >> $UHOME/.vimrc \
    && echo "call vundle#end()" >> $UHOME/.vimrc \
    && echo "filetype plugin indent on" >> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-go'"g >> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-javascript'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/nerdcommenter'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/tabular'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/delimitMate'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-indent-guides'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-less'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/html5.vim'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-json'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-airline'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-easymotion'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/undotree'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/tagbar'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/EasyGrep'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/bufexplorer'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/ctrlp.vim'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/nerdtree'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-nerdtree-tabs'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/syntastic'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/tlib_vim'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-addon-mw-utils'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/taglist.vim'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-expand-region'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-fugitive'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-gitgutter'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-markdown'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-indent-object'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-multiple-cursors'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-repeat'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-surround'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/mru.vim'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/YankRing.vim'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-haml'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/ultisnips'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-snippets'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-scala'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/vim-tmux-navigator'"g>> $UHOME/.vimrc \
    && echo "Plugin 'file:///~/bundle/Dockerfile.vim'"g>> $UHOME/.vimrc \
    && sed -i '/colorscheme peaksea/d' $UHOME/.vimrc

#RUN vim -E -c 'PluginInstall' -c q ; return 0
#RUN vim -c 'PluginInstall' -c 'qa!' >/dev/null ; return 0


VOLUME ["/srv"]
ENTRYPOINT ["vim"]
#CMD ["/bin/sh"]
