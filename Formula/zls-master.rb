class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.40+d5d31d9a"
  license "MIT"
  revision 4
  # zls_commit: d5d31d9af3
  # zig_version: 0.17.0-dev.329+21b7ceb5e

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "8aa85967fff37733ff9dc5c8468128c29211c2c7b990bdb599171bb560c7a51f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "e2d72a5762e90a2301a6dedbf2f99ff494e82ec542c0567fd02fcfba3cd83e4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "5742ff2d9fa13e140bda52fb65c8a3a1ff5c6596ccf384bffd48a22b05aab242"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "e43785b8eca280d4ec628532225b3b7b6af090b7a6520be5ce915b3e9d056732"
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
