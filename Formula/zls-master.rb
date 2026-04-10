class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.300+f391142c"
  license "MIT"
  revision 1
  # zls_commit: f391142ce2
  # zig_version: 0.16.0-dev.3142+5ccfeb926

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "ddbebf20db341c3afe1e2324d074a115cb0da0594cb961cc7741ae41394ce828"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "d54086176ab348c88077c7d5152d540f255cf3f9c3e4998f713b206b8f726bc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "b17b0c55a614917b924ee2c62eea047384d96edfa53d6a31af6ca8075c7b03b0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "86bcdc10c675d81e9ee048def42311bb79fd4c73fbff52fcb2698c5a5d7d97e0"
    end
  end

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    system bin/"zls", "--version"
  end
end
