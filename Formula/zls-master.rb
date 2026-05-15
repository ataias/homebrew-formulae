class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.37+e4bfcd4a"
  license "MIT"
  # zls_commit: e4bfcd4a0f
  # zig_version: 0.17.0-dev.304+9787df942

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "b0d85af55581267a77a90bc7f5b8aae4bd3a6f6126213177d1cbed057111ca73"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "ae60c32eef5dfd75f0a641e9e464a1621c0f4f58e2c85d7b40907f93eeeb0eda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "6eec37a97b401491432b260523f69945f3b5ed334ff4f41562598d12f1389c3f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "ad0a30ecf8968349ba3e12f1abe75f837f73b1f7d19067e82d3a774016d5cff7"
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
