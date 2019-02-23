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
  convert .mkv
  convert .srt
  convert .flac
  convert .m4v
}

function convert() {
	echo "~~ CONVERTING $FILETYPE ~~"
	local FILETYPE=$1
  local VIDEO_COUNT=$(count $FILETYPE)
  local new_dir=$PATH_ARG/Converted_$FILETYPE


	for file in $PATH_ARG*$FILETYPE ; do
	    local bname=$(/usr/bin/basename "$file" $FILETYPE)
	    local mp4name="$bname.mp4"
	    /usr/local/bin/ffmpeg -i "$file" "$PATH_ARG$mp4name" -hide_banner -loglevel verbose
  done

  if [ $VIDEO_COUNT > 0 ] ; then 
    mkdir $new_dir
    mv $mp4name $new_dir
  fi 

}

function count() {
  local FILETYPE=$1
  local COUNTER=0

  for video in $FILETYPE
  do
    let COUNTER=$COUNTER+1
  done

  echo $COUNTER
}

convert_all_to_mp4
