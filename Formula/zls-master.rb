class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.41+31963d0a"
  license "MIT"
  # zls_commit: 31963d0a0c
  # zig_version: 0.17.0-dev.340+c02d39a21

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "c1e1830233372d1ca8e7b3ee7791076f8cd8fd2a240c4997bf3074be70e9c736"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "b428d80562b5812fc261ea338d9a696e966149a7ac5be7228a0e5a58f305de19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "6c51d10a3172af7081a27a2cc5eb1d3e088cd428b790dfd78851ec6a34472ba8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "4fb28e2155b3aaa04a179421018480c27fdc5cc31991b865381d22bf92f2fff9"
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
