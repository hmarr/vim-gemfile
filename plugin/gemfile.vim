if !has('python')
  finish
endif

python << EOF
def _gemfile_add(gem_name=None):
    import vim
    import sys
    import urllib
    import json

    if gem_name is None:
      gem_name = vim.eval('input("Gem name: ")')

    url = 'https://rubygems.org/api/v1/gems/{}.json'.format(gem_name)
    response = urllib.urlopen(url)
    if response.getcode() != 200:
        sys.stderr.write('Could not find gem named {}\n'.format(gem_name))
        return

    data = json.loads(response.read())
    gem_definition = 'gem "{}", "~> {}"'.format(gem_name, data["version"])

    # Insert new line this way to preseve automatic indentation
    vim.command('execute "normal o\\<Space>\\<BS>\\<Esc>"')
    vim.current.line += gem_definition
EOF
command -nargs=* GemfileAdd :python _gemfile_add(<f-args>)
