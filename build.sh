projectId=$1
if [ -z $projectId ] ;then
    echo 'please assign projectId'
    exit 1
fi

if [ ! -d generateProject ]; then
    mkdir generateProject
fi

cp -rf template generateProject/
cd generateProject
mv template $projectId
cd $projectId

mv template-common $projectId-common
mv $projectId-common/src/main/java/com/hogo/template $projectId-common/src/main/java/com/hogo/$projectId
mv $projectId-common/src/test/java/com/hogo/template $projectId-common/src/test/java/com/hogo/$projectId

mv template-dao $projectId-dao
mv $projectId-dao/src/main/java/com/hogo/template $projectId-dao/src/main/java/com/hogo/$projectId
mv $projectId-dao/src/test/java/com/hogo/template $projectId-dao/src/test/java/com/hogo/$projectId
mv $projectId-dao/src/main/resources/com/hogo/template $projectId-dao/src/main/resources/com/hogo/$projectId

mv template-model $projectId-model
mv $projectId-model/src/main/java/com/hogo/template $projectId-model/src/main/java/com/hogo/$projectId
mv $projectId-model/src/test/java/com/hogo/template $projectId-model/src/test/java/com/hogo/$projectId

mv template-rpc $projectId-rpc
mv $projectId-rpc/src/main/java/com/hogo/template $projectId-rpc/src/main/java/com/hogo/$projectId
mv $projectId-rpc/src/test/java/com/hogo/template $projectId-rpc/src/test/java/com/hogo/$projectId

mv template-service $projectId-service
mv $projectId-service/src/main/java/com/hogo/template $projectId-service/src/main/java/com/hogo/$projectId
mv $projectId-service/src/test/java/com/hogo/template $projectId-service/src/test/java/com/hogo/$projectId

mv template-web $projectId-web
mv $projectId-web/src/main/java/com/hogo/template $projectId-web/src/main/java/com/hogo/$projectId
mv $projectId-web/src/test/java/com/hogo/template $projectId-web/src/test/java/com/hogo/$projectId

export LC_CTYPE=C
export LANG=C
sed -i '' "s/template/$projectId/g" `grep template -rl .`
