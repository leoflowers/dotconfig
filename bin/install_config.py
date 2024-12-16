import argparse
import os
import pathlib
import subprocess


def exists(name):
    result = subprocess.run(['which', name])
    return True if result.returncode == 0 else False


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--home_path', help='full home path')
    parser.add_argument('--override', help='override old config', action='store_true')
    args = parser.parse_args()
    
    if args.home_path:
        home_path = args.home_path
    else:
        print('No home path specified, defaulting to $HOME')
        home_path = os.environ['HOME']
    
    one_up = pathlib.Path(__file__).parent.parent.resolve()
    
    for entry in one_up.iterdir():
        if (not entry.is_dir()) or (entry.name == 'bin') or (entry.name[0] == '.'):
            continue
    
        if not exists(entry.name):
            print(f'program {entry.name} does not exist')
            continue
    
        target = next(entry.glob('*')).resolve()
        name = pathlib.Path(f'{home_path}/.{target.name}')
    
        if pathlib.Path(name).exists():
            print('Config already exists')
    
        if args.override:
            print('Overriding old config')
            subprocess.run(['ln', '-sf', target, name])

