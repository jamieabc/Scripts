require 'digest'
require 'ap'

files = [
  "https://github.com/vstakhov/libucl/archive/master.zip",
  "https://github.com/P-H-C/phc-winner-argon2/archive/master.zip",
  "https://codeload.github.com/bitmark-inc/bitmarkd/tar.gz/v8.2",
  "https://codeload.github.com/bitmark-inc/go-argon2/tar.gz/v1.3",
  "https://codeload.github.com/bitmark-inc/go-libucl/tar.gz/v1.2",
  "https://codeload.github.com/bitmark-inc/listener/tar.gz/v1.3",
  "https://codeload.github.com/bitmark-inc/logger/tar.gz/v3.4",
  "https://codeload.github.com/cihub/seelog/tar.gz/f561c5e",
  "https://codeload.github.com/golang/crypto/tar.gz/e363607",
  "https://codeload.github.com/golang/snappy/tar.gz/2e65f85",
  "https://codeload.github.com/golang/sys/tar.gz/4497e2d",
  "https://codeload.github.com/pebbe/zmq4/tar.gz/3515f4e",
  "https://codeload.github.com/syndtr/goleveldb/tar.gz/ae2bd5e",
  "https://codeload.github.com/urfave/cli/tar.gz/934abfb"
]

data = {}

files.each do |f|
  matched = /https:.*\/(.*)\/.*\/(.*)$/.match(f)
  package_name = matched[1]
  version = matched[2]

  # download file
  `wget #{f}`

  sha = Digest::SHA256.new
  sha256 = sha.file(version)
  data[package_name] = [f, sha256.to_s]

  # remove file
  `rm #{version}`
end

ap data
