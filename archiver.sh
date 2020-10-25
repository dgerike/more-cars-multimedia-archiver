#!/bin/sh

# Environment variable TARGET_DIRECTORY has to exist
if [[ -z "${TARGET_DIRECTORY}" ]]; then
  echo "Environment variable 'TARGET_DIRECTORY' missing!"
  exit 1
fi

# get all videos from More Cars
node libs/fetch_videos_from_more_cars.js

# extract the video IDs
VIDEO_IDS=$(node libs/get_video_ids.js)

# convert this list into an array
video_id_list=$(echo "$VIDEO_IDS" | tr "," "\n")

# download all videos from youtube
for id in ${video_id_list}; do
  echo "Downloading video "${id}
  docker run --rm -v $TARGET_DIRECTORY:/data vimagick/youtube-dl -R 10 -r 0.5M -o '%(id)s | %(title)s | %(resolution)s' -- ${id}
  sleep 10s
done
