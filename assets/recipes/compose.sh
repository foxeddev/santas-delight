#!/usr/bin/env bash

# --- CONFIG ---
SRC_DIR="./source"               # Folder with input images
OUT_DIR="./output"               # Folder for final images
BASE_IMAGE="./base.png"          # Background image

CROP_GEOMETRY="286x132+832+356"  # Crop width/height/offset
OFFSET_X=56                      # X offset for placement
OFFSET_Y=10                      # Y offset for placement
# --------------------------------------------

mkdir -p "$OUT_DIR"

for img in "$SRC_DIR"/*; do
    filename=$(basename "$img")
    cropped="/tmp/cropped_$filename"

    echo "Processing $filename ..."

    # 1. Crop source image
    magick "$img" -crop "$CROP_GEOMETRY" "$cropped"

    # 2. Place cropped image on base
    magick composite \
        -geometry +${OFFSET_X}+${OFFSET_Y} \
        "$cropped" \
        "$BASE_IMAGE" \
        "$OUT_DIR/$filename"

    rm "$cropped"
done

echo "Done! Images saved in $OUT_DIR"
