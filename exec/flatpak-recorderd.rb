require 'json'
require 'awesome_print'

def main
  go_mod_file = '/Users/Aaron/Documents/Project/Bitmark/bitmarkd/go.mod'
  tmp_file = 'test'
  hsh = {}

  File.open(go_mod_file) do |file|
    file.each do |line|
      truncated = line.strip.gsub(' // indirect', '')
      if /^(github|golang)/.match? truncated
        package, version = extract_info truncated
        url = package + '/tar.gz/' + version
        download_file url
        hash = sha256
        `rm #{tmp_file}`
        hsh[url] = hash
      end
    end
  end
  ap hsh
end


def extract_info (str)
  package, version = str.split(' ')
  if compound_version? version
    commit_hash = version.split('-').last
    return [package, commit_hash]
  end
  [package, version]
end

def compound_version? (str)
  str.split('-').size > 1
end

def download_file (path)
  github_download_url = 'https://codeload.github.com/'
  tmp_file = 'test'
  actual_path = path.gsub('github.com/', '')
  url = github_download_url + actual_path
  # `wget #{url} -O #{tmp_file}`
  `curl -LJ #{url} -o #{tmp_file}`
end

def sha256
  tmp_file = 'test'
  `shasum -a 256 #{tmp_file}`.split(' ').first
end

main
