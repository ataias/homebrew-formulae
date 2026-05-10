class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.26+f2986764"
  license "MIT"
  revision 1
  # zls_commit: f298676494
  # zig_version: 0.17.0-dev.269+ebff43698

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "d2ddca73e6ad19e53bc3760335eed325682f43aa28fcb1a8635ea5aa42b2cd15"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "364d7a17910c31870049f25f42b93eeee4e90ce976335e6150768bb8aadcedc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "52b80b0fca62cd3b57536752623ced92b468b4d9ab74d897e8916f8f81a443aa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "55f844b77c75c2a624b98b16c6048028f04aae964ad63aae16924d8153f722a5"
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
