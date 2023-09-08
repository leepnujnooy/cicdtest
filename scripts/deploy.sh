

REPOSITORY=/
cd $REPOSITORY

APP_NAME=cicdtest
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if[ $CURRENT_PID -z ]
then
  echo "> 종료할거없음"

else
  echo "> kill -9 $CURRENT_PID"
  kill  -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH 배포"
nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &
