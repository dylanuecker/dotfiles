#!/bin/bash

imageName="libreoffice"
imageTag="latest"

if [[ $# -ne 1 ]]; then
   echo "Usage: pptx2pdf.sh <filename.pptx>"
   echo "I am lazy, must be called within same directory"
   exit -1
fi

# if image doesn't exist, build it
if [ "$(docker image inspect $imageName:$imageTag 2> /dev/null)" = "[]" ]; then
	echo "LibreOffice docker image does not exist, building it"
	docker build -t $imageName:$imageTag .
    if [ "$(docker image inspect $imageName:$imageTag 2> /dev/null)" = "[]" ]; then
        echo "Build failed"
        exit -1
    fi
fi

fn=$(basename $1 .pptx)
# definitely a better way to do this, but don't want to volume mount
# entire directory when I only need the one file, so using a dummy directory
mv $1 ~/dotfiles/libre/toco/
echo "converting $1 --> ${fn}.pdf"
docker run --rm \
	-v ~/dotfiles/libre/toco:/toco \
	$imageName:$imageTag \
	/bin/bash -c "cd /toco && soffice --headless --convert-to pdf $1 >/dev/null 2>&1"
echo "removed $1"
mv ~/dotfiles/libre/toco/${fn}.pdf .
rm ~/dotfiles/libre/toco/*
echo "opening ${fn}.pdf"
xdg-open ${fn}.pdf &
