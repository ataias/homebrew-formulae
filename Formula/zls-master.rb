class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.13+113f79a1"
  license "MIT"
  revision 1
  # zls_commit: 113f79a1d1
  # zig_version: 0.17.0-dev.215+8c5542bd3

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "76c5462d7c5d863919235c44878d6c15f8397b5d58fcadc8db5df67dfc9cd191"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "fcd8dfd8d2363000a928da856120a32839f03bc2c594d82945d8b8f1d69e026f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "adee5d78dbdf1d454132fc1edcddb68097c5b333c58c81939dcf06467a46869f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "1cd5685b89272fb55dd49025c6f62f41c2f99669f636a46d20ce5d9e7025173d"
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
