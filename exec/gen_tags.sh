#!/bin/bash
# Generate cscope and ctags tag files
#trash cscope*
#find -L $PWD -name "*.[ch]" -or -name "*.cpp" -or -name "*.cc" -or -name "*.java" > cscope.files
#cscope -Rbkq -i cscope.files

if [ $# == 0 ]; then
    echo "Usage:gen_tags.sh \$1 \$2"
    echo " \$1: e - emacs"
    echo "     c - ctags"
    echo "     s - cscope"
    echo " \$2: 1 - remove previous tag files"
    exit
fi

# Delete tag files
if [ "$2" == "1" ]; then
    if [ "$1" == "e" ]; then
        rm GTAGS
        rm GRTAGS
        rm GPATH
        rm gtags.files

    elif [ "$1" == "c" ]; then
        if [ -f TAGS ]; then
            rm TAGS
        fi

    elif [ "$1" == "s" ]; then
        if [ -f cscope.files ]; then
            rm cscope.files
            rm cscope.in.out
            rm cscope.out
            rm cscope.po.out
        fi
    fi
fi

if [ "$1" == "e" ]; then
    if [ ! -f TAGS ]; then
        #etags -R --sort=yes --c++-kinds=+px --fields=+faiKlSzm --extra=+q *
        #find . -name '*.[ch]' -or -name '*.cpp' -or -name '*.java' -or -name '*.hx' -or -name '*.def' | xargs etags -a
        echo "TAGS file not exist"
    else
        #find . -name '*.[ch]' -or -name '*.cpp' -or -name '*.java' -or -name '*.hx' -or -name '*.def' | xargs etags -a
        #etags -a -f TAGS -R --sort=yes --c++-kinds=+px --fields=+faiKlSzm --extra=+q *
        echo "TAGS file exist"
    fi

    #find -L $PWD -type f -print > gtags.files
    #gtags -f gtags.files
    if [ ! -f GTAGS ]; then
        #gtags --gtagsconf ~/.emacs.d/gtags.conf
        find . -type f -name "*.js" -o -name "*.jsx" -o -name "*.tmpl" -o -name "*.rb" -o -name "*.rspec" -o -name "*.yml" -o -name "*.c" -o -name "*.h" -o -name "*.cpp" | grep -vE '(node_modules|build|-min.js$|.min.js$|__site_|.git|.json)' > gtags.files
        gtags -f gtags.files
    else
        #gtags -i --gtagsconf ~/.emacs.d/gtags.conf
        gtags -i
    fi
    #htags --suggest

elif [ "$1" == "c" ]; then
    #ctags -R -e --sort=yes --c++-kinds=+px --fields=+faiKlSzm --extra=+q --exclude='*node_modules*' --exclude='bundle.js' --exclude=locales --exclude='*/build/*' --exclude=.git --exclude='*.min.js' --exclude='*.html' --exclude='-min.js' *
    find -L $PWD -type f -not -iwholename '*TAGS' -not -size +16k ! \( -name "*.json" -o -name "*.gem" -o -name "*.html" -o -path "*.git*" -o -path "*node_modules" -o -name "bundle.js" -o -name "*.cache" -o -name "*.log" \) | ctags -f TAGS -e -L -

    # lookupfile
    #echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
    #find -L $PWD -not -regex '.*\.\(png\|gif\)' ! \( -name "*.swp" -o -name "*.cmd" -o -name "*.o" -o -path "*.repo*" -o -name "*.jar" -o -name "*.so" -o -path "*.svn*" -o -path "*.git*" -o -path "out_qisda_usb_wifi" \) -type f -printf "%f\t%p\t1\n" | sort -f >> filenametags
    # ctags -R -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --links=yes --sort=foldcase --c++-kinds=+p --c-kinds=+p --fields=+iaS --extra=+q --exclude=.git/

elif [ "$1" == "s" ]; then
    find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.cc" -o -name "*.java" -o "*.js" -not -path "*/build/*" -not -path "*/node_modules/*" > cscope.files
    cscope -q -R -b -i cscope.files

elif [ "$1" == 'r' ]; then
    ctags -a -e -f TAGS --tag-relative -R app lib vendor
fi
