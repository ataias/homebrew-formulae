class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.36+f0bb3d27"
  license "MIT"
  # zls_commit: f0bb3d2780
  # zig_version: 0.17.0-dev.304+9787df942

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "aee3cf8523a58b5f523752ac64b730cc575afae853c9f23e08c006a4acb3de5c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "c6de1cbff854de000effd3acedf8a83462895e5cc5b4151484567507ea47ebb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "3c1ffdfbcd8f9ce433191ab2fd51cb43a4f717051c75a440b8eb1e72423d128c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "bca001d487327fc63c6cba851c9de6488c72995004e80795d3349f227243e1b3"
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
