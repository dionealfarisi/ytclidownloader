# YouTube Downloader CLI
![Image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfCeukBziSHXTb3m8_FD2vfwsQf_FQBrrXPw&s)
YouTube Downloader CLI is a command-line tool to download videos or audio from YouTube using `yt-dlp` and `rich` for progress display.

## Features

- Download videos in the best available quality.
- Download audio in MP3 format with the best available quality.
- Display download progress using `rich`.

## Requirements

- Python 3.6+
- `yt-dlp`
- `rich`

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/dionealfarisi/ytclidownloader.git
    cd ytclidownloader
    ```

2. Install the required packages:
    ```sh
    chmod +x install.sh
    bash install.sh
    ```

## Usage

Run the script with the following command:

```sh
yt <type> <url> [--path <path>]
```

- `<type>`: `audio` or `video`
- `<url>`: URL of the YouTube video
- `--path <path>`: (Optional) Path to save the downloaded file (default: current directory)

### Examples

Download a video:

```sh
yt video https://youtu.be/your_video_url
```

Download audio:

```sh
yt audio https://youtu.be/your_video_url
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
