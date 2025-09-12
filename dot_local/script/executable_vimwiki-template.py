#!/usr/bin/env python3

import datetime as dt
import re
import sys

from pathlib import Path

class TemplateRenderer:
    def __init__(self, template: Path, target: Path):
        self.template = template
        self.target = target

        # read lines from template
        with open(template, 'r') as file:
            self.lines = file.readlines()

        # get date based on target name
        self.date = get_note_date(target)

    def render(self) -> str:
        [self.render_line(n) for n in range(len(self.lines))]
        return ''.join(self.lines)

    def render_line(self, n: int):
        # replace <key> with <value>
        replacements = {
            '%DATE%': self.date.strftime('%Y-%m-%d'),
            '%DAY%': self.date.strftime('%a'),
            '%TITLE%': self.target.name.rsplit('.', 1)[0],
            '%FILENAME%': self.target.name,
            '%PATH%': str(self.target.resolve()),
        }

        # go through replacements dict, applying all one by one
        line = self.lines[n]
        for key in replacements:
            line = line.replace(key, replacements[key])
        self.lines[n] = line

    def replace_date(self, line: str) -> str:
        date = self.date.strftime('%Y-%m-%d')
        return line.replace('%DATE%', date)

    def replace_day_name(self, line: str) -> str:
        day = self.date.strftime('%a')
        return line.replace('%DAY%', day)

    def replace_filename(self, line: str) -> str:
        filename = self.target.name
        return line.replace('%FILENAME%', filename)

    def replace_title(self, line: str) -> str:
        title = self.target.name.rsplit('.', 1)[1]
        return line.replace('%TITLE%', title)


def get_note_date(p: Path) -> dt.date:
    # look for YYYY-MM-DD in the last 2 levels of the note's path (parent and filename)
    path_end = p.parent.name + '/' + p.name
    match = re.search(r'\d{4}-\d{2}-\d{2}', path_end)

    # if no match found, use today's date
    if match == None:
        return dt.datetime.today()

    # if found, convert string to a datetime object
    return dt.datetime.strptime(match.group(), '%Y-%m-%d')


def locate_template(note: Path) -> Path | None:
    # get the extension of the note file
    ext = note.name.rsplit('.', 1)[1]

    # look for a `template.<ext>` in the same directory
    template_path = note.parent / f'template.{ext}'
    if template_path.exists() and template_path.is_file():
        return template_path
    else:
        return None


def main(argv) -> int:
    # check arguments in the simplest, stupidest way
    if len(argv) != 2:
        print('Usage: vimwiki-template /PATH/TO/FILENAME.wiki')
        return 1

    # print help message
    if argv[1] == '-h' or argv[1] == '--help':
        print('Usage: vimwiki-template /PATH/TO/FILENAME.wiki')
        return 0
    
    # convert to a path, but DO NOT check existence.
    # this file likely hasn't been written yet.
    note_path = Path(argv[1])

    # if no template, do nothing -- not even print an error
    template = locate_template(note_path)
    if template == None:
        return 0

    r = TemplateRenderer(template, note_path)
    output = r.render()
    print(output)
    return 0


if __name__ == '__main__':
    status = main(sys.argv)
    exit(status)
