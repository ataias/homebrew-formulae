class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.40+d5d31d9a"
  license "MIT"
  revision 5
  # zls_commit: d5d31d9af3
  # zig_version: 0.17.0-dev.338+0d4f3cc67

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "3bc4fab3d5f026a74db9f97fe484befe4e1464de04a79733da7255d02230fa6a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "5934c6de5f8fd5202238b3d8df144b6874c6e2d8d1f3df6e7013d6fc035c4af6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "37884574e0d466e159e5e89e5f340cf75dd85f978dfb9538186c71e56bc042af"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "2463086c7f4443f21b0091b63fc78c3122255bfa63e54b34438ccc7aab418edc"
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
