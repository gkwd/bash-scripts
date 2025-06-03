DEFAULT_FOLDERS=("node_modules" "dist" ".cache")
ADDITIONAL_FOLDERS=()

# Обработка аргументов
for arg in "$@"; do
case $arg in
    --additional-folder=*)
    folder="${arg#*=}"
    ADDITIONAL_FOLDERS+=("$folder")
    ;;
    *)
    echo "Неизвестный аргумент: $arg"
    ;;
esac
done

echo "Cleaning default folders: ${DEFAULT_FOLDERS[*]}"
rm -rf "${DEFAULT_FOLDERS[@]}"

if [ ${#ADDITIONAL_FOLDERS[@]} -gt 0 ]; then
echo "Cleaning additional folders: ${ADDITIONAL_FOLDERS[*]}"
rm -rf "${ADDITIONAL_FOLDERS[@]}"
fi

echo "Done!"

