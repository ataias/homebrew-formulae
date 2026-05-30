class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.44+8da87d4f"
  license "MIT"
  revision 2
  # zls_commit: 8da87d4f33
  # zig_version: 0.17.0-dev.420+8086ae176

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "f65c5805cf8392c537cc2b7cef011584fb59eaf53d6ec75c7f2457ee175de241"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "a311b96e380eab423a9a26e9fcd2fb13cc7316277c450926bb3904902fa1f8bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "2135cd7cb2cdd55012866f4fbf28a66720e0ff7dd3d190a36bb1ce2213df7dfa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "8d59106b58d8af4a44219aa15e44c1487b0a0fd73fa927a838575b39bc7c32b2"
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
