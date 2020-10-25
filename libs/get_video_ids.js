const videos = require('../temp/videos.json')

let videoCollection = [];

videos.forEach(video => {
    if (video.video_platform === 'youtube') {
        videoCollection.push(video.video_platform_id);
    }
});

console.log(videoCollection.toString());
