COMPONENT_NAME=""
COMPONENT_TYPE="component" # или 'page'
USE_TYPESCRIPT=false
TARGET_DIR="src/components"
STYLE_EXT="module.css"

# Парсинг аргументов
for arg in "$@"; do
case $arg in
    --name=*)
    COMPONENT_NAME="${arg#*=}"
    ;;
    --type=*)
    COMPONENT_TYPE="${arg#*=}"
    ;;
    --ts)
    USE_TYPESCRIPT=true
    ;;
    --dir=*)
    TARGET_DIR="${arg#*=}"
    ;;
    --style=*)
    STYLE_EXT="${arg#*=}"
    ;;
    *)
    echo "Неизвестный аргумент: $arg"
    ;;
esac
done

# Проверка имени
if [ -z "$COMPONENT_NAME" ]; then
read -p "Введите имя компонента: " COMPONENT_NAME
fi

# Обновляем путь
FINAL_DIR="$TARGET_DIR/$COMPONENT_NAME"
FILE_EXT="js"
$USE_TYPESCRIPT && FILE_EXT="tsx"

mkdir -p "$FINAL_DIR"

# Создание файлов
echo "📁 Создание компонента в $FINAL_DIR"

cat <<EOF > "$FINAL_DIR/index.$FILE_EXT"
import React from 'react';
import styles from './$COMPONENT_NAME.$STYLE_EXT';

const $COMPONENT_NAME = () => {
return (
<div className={styles.wrapper}>
</div>
);
};

export default $COMPONENT_NAME;
EOF

touch "$FINAL_DIR/$COMPONENT_NAME.$STYLE_EXT"

echo "Компонент $COMPONENT_NAME создан."
