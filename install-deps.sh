CLEAN=false

for arg in "$@"; do
case $arg in
    --clean)
    CLEAN=true
    ;;
    *)
    echo "Неизвестный аргумент: $arg"
    ;;
esac
done

if [ "$CLEAN" = true ]; then
echo "Выполняется чистая установка..."
rm -rf node_modules package-lock.json dist
else
echo "Установка зависимостей (без очистки)..."
fi

npm install
echo "Установка завершена."