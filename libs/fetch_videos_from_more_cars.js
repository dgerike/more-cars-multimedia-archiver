const fs = require('fs');
const fetch = require('node-fetch');

fetchVideos()
    .then(videos => {
        fs.mkdirSync('temp');
        fs.writeFileSync('temp/videos.json', JSON.stringify(videos));
    });

function fetchVideos() {
    return fetch('https://more-cars.net/api/v1/videos', {
        method: 'GET'
    })
        .then(r => r.json())
        .then(r => {
            return r;
        });
}
