class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.13+113f79a1"
  license "MIT"
  # zls_commit: 113f79a1d1
  # zig_version: 0.17.0-dev.135+9df02121d

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "5613f4535602ca77f19dbca3726a277b602c66f171d9e20a53815bbfb467d756"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "4f00e00d598514905a30850bfbea72e6c5b3c1242efeb9272de28b0f07a8c37c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "cdbd02360003199f205b3e72159217fadf4b42157551721db34f5473d9ea184a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "8f4d0f8381c3bc9acc126894a847093396ac7ae2bc628c21ee10f1cc185d41bb"
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
