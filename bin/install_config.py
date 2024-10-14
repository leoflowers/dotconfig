import argparse
import os
import pathlib
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--home_path', help='full home path')
parser.add_argument('--override', help='override old config')
args = parser.parse_args()

if args.home_path:
    home_path = args.home_path
else:
    print('No home path specified, defaulting to $HOME')
    home_path = os.environ['HOME']

one_up = pathlib.Path(__file__).parent.parent.resolve()

for entry in one_up.iterdir():
    if entry.is_dir() and (entry.name != 'bin') and (entry.name != '.git'):
        target = next(entry.glob('*')).resolve()
        name = pathlib.Path(f'{home_path}/.{target.name}')

        if pathlib.Path(name).exists():
            print('Config already exists')
            if not args.override:
                print('Not overriding')
                continue

        subprocess.run(['ln', '-sf', target, name])
