class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.296+ef64fa01"
  license "MIT"
  revision 2
  # zls_commit: ef64fa01d9
  # zig_version: 0.16.0-dev.3061+9b1eaad13

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "457e0533029182b0595049804794b7b47c38360e6045016d393282599858eff7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "f09ed7bcf7ef4421abf435e3a9e235f4c3c07ffcc8715a7c7674277aae4143ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "1736a2cb8292b3c7ec8cc8f0a33cb1331e051a0038f4e03315a183f9ea12f8c1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "9abc67e8986b86719e91400ed27661dd4e43be8cffee50abbdc567b1acc7d767"
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
