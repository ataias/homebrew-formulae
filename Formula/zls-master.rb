class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.37+e4bfcd4a"
  license "MIT"
  revision 1
  # zls_commit: e4bfcd4a0f
  # zig_version: 0.17.0-dev.305+bdfbf432d

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "84c86322474b30bb1acbe20128b21fc939f662ae9a0e9bbc387bd632bd109a45"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "549b8be78c99f25a81b6ab1a142f1a730e3e13b935559b077e533c32ecfcd426"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "98422fd52224f660d5e64cf9ce80817c7691611291497d5be2d2efe96a328804"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "187c8d2d782fee59d58bd66085ba1d5521940874eb54464bb905a38fd8e41cd2"
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
