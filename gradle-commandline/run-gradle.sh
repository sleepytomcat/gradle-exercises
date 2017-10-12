echo "===== 1) display version"
gradle -v

echo "===== 2) executing multiple tasks"
echo "=====    note that every task is executed no more than once"
echo "=====    -q switch forces 'minimalistic' output"
gradle -q dist test

echo "===== 3) excluding tasks from execution"
echo "=====    executing 'dist' but not 'test' (and all of its pre-requisites)"
gradle -q dist -x test
