#!/usr/bin/env python3

import instaloader
import argparse
import os
from rich.console import Console

__VERSION__ = "1.0.0"
__UPDATE__ = "05/10/2024"
__AUTHOR__ = "dionealfarisi"
console = Console()

def download_instagram_post(url, path, session_file):
    """
    Download Instagram post using Instaloader with session file.
    """
    try:
        L = instaloader.Instaloader(dirname_pattern=path)

        # Load session
        if os.path.exists(session_file):
            console.print(f"[yellow]Loading session from {session_file}[/yellow]")
            L.load_session_from_file(session_file)
        else:
            console.print(f"[bold red]Session file not found: {session_file}[/bold red]")
            return

        # Extract shortcode from URL
        try:
            shortcode = url.rstrip('/').split("/")[-2]
            if not shortcode:
                raise ValueError("Invalid URL structure")
        except Exception as e:
            console.print(f"[bold red]Error extracting shortcode: {e}[/bold red]")
            return

        # Download the post using the shortcode
        post = instaloader.Post.from_shortcode(L.context, shortcode)
        L.download_post(post, target=path)
        console.print("[green]Download complete![/green]")
    except Exception as e:
        console.print(f"[bold red]An error occurred: {e}[/bold red]")

def validate_path(path):
    """
    Validate if the provided path is a valid directory.
    """
    if not os.path.isdir(path):
        raise argparse.ArgumentTypeError(f"Invalid path: {path}. Please enter a valid directory.")
    return path

def main():
    parser = argparse.ArgumentParser(
        description="Instagram Post Downloader CLI",
        epilog=f"""Examples of usage:
        Download an Instagram post:
          ig https://www.instagram.com/p/shortcode/ --path /downloads --session session-file
    \nAuthor: {__AUTHOR__}
        """,
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument('url', help="Valid Instagram post URL")
    parser.add_argument('--path', type=validate_path, default='.', help="Directory to save the downloaded post (default: current location)")
    parser.add_argument('--session', default='session', help="Session file (default: 'session')")
    parser.add_argument('--version', action='version', version=f"%(prog)s {__VERSION__} latest update: {__UPDATE__}")

    args = parser.parse_args()

    console.print("[bold blue]=== Instagram Post Downloader ===[/bold blue]")
    console.print(f"URL: [yellow]{args.url}[/yellow]")
    console.print(f"Path: [magenta]{args.path}[/magenta]")
    console.print(f"Session file: [cyan]{args.session}[/cyan]")

    download_instagram_post(args.url, args.path, args.session)

if __name__ == "__main__":
    main()