SEARCH_PATH="src"
SAVE_FILE=""
KEYWORDS=("TODO" "FIXME")
IGNORE_DIRS=("node_modules" "dist" "build" ".git")

# Разбор аргументов
for arg in "$@"; do
case $arg in
    --dir=*)
    SEARCH_PATH="${arg#*=}"
    ;;
    --save=*)
    SAVE_FILE="${arg#*=}"
    ;;
    *)
    echo "Неизвестный аргумент: $arg"
    ;;
esac
done

echo "🔍 Поиск TODO/FIXME в директории: $SEARCH_PATH"

PATTERN=$(IFS="|"; echo "${KEYWORDS[*]}")

# Сбор аргументов для find
FIND_IGNORE=()
for DIR in "${IGNORE_DIRS[@]}"; do
FIND_IGNORE+=(-path "*/$DIR/*" -prune -o)
done

# Запуск поиска
if [ -n "$SAVE_FILE" ]; then
echo "Результаты будут сохранены в: $SAVE_FILE"
find "$SEARCH_PATH" "${FIND_IGNORE[@]}" -type f -name "*.*" -exec grep -nEH "$PATTERN" {} + > "$SAVE_FILE"
echo "Результаты сохранены."
else
find "$SEARCH_PATH" "${FIND_IGNORE[@]}" -type f -name "*.*" -exec grep --color=always -nEH "$PATTERN" {} +
echo "Поиск завершён."
fi

