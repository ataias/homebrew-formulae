class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.13+113f79a1"
  license "MIT"
  revision 3
  # zls_commit: 113f79a1d1
  # zig_version: 0.17.0-dev.228+ce198b7c2

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "500c48397d2f90354b136562b5c5fe447dcd42f4e523f127268c48097dc114ca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "597e89b6b43b828e30be447d1b49bad28de71aae248d541a1dfbd7556f6e50f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "cd309a922df00fa10ab5ad6545e00cca090e616e314867f5a16694bbb584972d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "5d0343e8e902bdde8dcaa709786c032b244aa71bbc3b1495e817a880e5911dbe"
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
