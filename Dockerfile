# Start from the official MediaCMS image
FROM mediacms/mediacms:latest

# Install tools needed for fetching/extracting
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget xz-utils && \
    rm -rf /var/lib/apt/lists/*

# Download Jellyfin ffmpeg portable build
RUN wget -q https://github.com/jellyfin/jellyfin-ffmpeg/releases/download/v7.1.1-7/jellyfin-ffmpeg_7.1.1-7_portable_linux64-gpl.tar.xz

RUN mkdir -p ffmpeg-tmp && \
    tar -xf jellyfin-ffmpeg_7.1.1-7_portable_linux64-gpl.tar.xz -C ffmpeg-tmp && \
    cp -v ffmpeg-tmp/ffmpeg ffmpeg-tmp/ffprobe /usr/local/bin && \
    rm -rf ffmpeg-tmp jellyfin-ffmpeg_7.1.1-7_portable_linux64-gpl.tar.xz
