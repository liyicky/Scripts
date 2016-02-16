#! /bin/bash
# Install ffmpeg: brew install ffmpeg

PATH_ARG="$1"

function convert_all_to_mp4() {

  if [[ -z $PATH_ARG ]] || [[ ! -d $PATH_ARG ]] ; then
	echo "~~ Please provide a path (Include '/') ~~"
	exit 1
  fi

  convert .flv
  convert .avi
  convert .mpg
  convert .wma
  convert .wmv
  convert .3gp
  convert .mov
}

function convert() {
	FILETYPE=$1

	echo "~~ CONVERTING $FILETYPE ~~"

	for file in $PATH_ARG*$FILETYPE ; do
	    local bname=$(/usr/bin/basename "$file" $FILETYPE)
	    local mp4name="$bname.mp4"
	    /usr/local/bin/ffmpeg -i "$file" "$PATH_ARG$mp4name" -hide_banner -loglevel verbose
	done
}

convert_all_to_mp4