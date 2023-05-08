#!/bin/bash

EXTENSION="js"
APP_FOLDER="my-app"

while getopts 'xf:' OPTION; do
  case "$OPTION" in
    x)
        EXTENSION="jsx"
        echo "Defaul react file extension will be {jsx}"
        ;;
    f)
        avalue="$OPTARG"
        echo "App folder will be created or creating files in existing folder $avalue"
        APP_FOLDER=$avalue
  esac
done

mkdir -p $APP_FOLDER/src/{components/{Button,Input},containers/{Home,About},hooks,hoc,contexts,redux/{actions,reducers,store},services,utils,router}
touch $APP_FOLDER/src/hooks/{useWindowSize,useLocalStorage}.js $APP_FOLDER/src/hoc/{withAuth,withLoading}.$EXTENSION $APP_FOLDER/src/contexts/{AuthContext,ThemeContext,AuthProvider,ThemeProvider}.$EXTENSION $APP_FOLDER/src/redux/{actions/{index,userActions}.js,reducers/{index,userReducer}.js,store/index.js} $APP_FOLDER/src/services/api.js $APP_FOLDER/src/router/{Router,routes}.js

