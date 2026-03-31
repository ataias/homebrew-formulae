class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.296+ef64fa01"
  license "MIT"
  # zls_commit: ef64fa01d9
  # zig_version: 0.16.0-dev.3041+3dc5f1398

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "2ead8ed8064ce589d4aba959efba701778fac3e786104b11499590e622c36c1a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "4604c29d6003000bf9699e19665ae6c0c06a714dec2c8a05b9b319580d107212"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "c85980408ba2f7bda8ff813e90510d4f44db81554ac8e14de3483480d779bcba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "a8ef10510e5200d1b151f1ea1c51178b3de038f1b181a697104b51908bfb3f62"
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
