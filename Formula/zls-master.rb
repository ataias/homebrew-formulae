class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.35+5d97c95a"
  license "MIT"
  # zls_commit: 5d97c95abe
  # zig_version: 0.17.0-dev.296+a85a29ae4

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "dd733c9281cfcd4b59fc31db742946cdeaeb548e0da05f47b05b863dccf1edb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "889a1ca4d90f1930693eb1461e3bff10a63749566b616a9795c9028a43c35288"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "4cc712a8f743a482ed718016d20dc012b4d3cb19e4b59267957a52b7aef8127a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "60b0e0321fcba3f2e42e460585409c35c4e63f9e20e28eb1f3e5946d7b114583"
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
