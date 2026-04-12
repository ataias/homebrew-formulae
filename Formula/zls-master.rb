class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.300+f391142c"
  license "MIT"
  revision 3
  # zls_commit: f391142ce2
  # zig_version: 0.16.0-dev.3146+0606af509

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "56a6510e9aab2f6baa1c8ce99108d6af0e391077a8db0311d35b8d5c1c121957"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "39bca49bda6ab5e8f0f26c26400e459b17f01d5b51874ce37bb3a9b9ad2c332b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "2669e65c7802bda5706796b7bb512fbef1ffc09757732e1d90b5f390603f2d1f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "ed190909e04d3b0187b3f9c32b02b19f0b8f4d1e285068b8c123fb3a50aab2bb"
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
