class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.297+42800187"
  license "MIT"
  # zls_commit: 4280018713
  # zig_version: 0.16.0-dev.3091+557caecaa

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "df72f380364727cb227420b067fe54f81b4e464589e44032bc84169ba92e688a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "a59d1c9aa4d51bf3d764d2420f3429f66ad343f3744bcfb931172dc944603b8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "77154ebdc6726add429fc72833d63178e69fd071641509193aea1356a1203b8f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "f7ce975142c1006b25fe7dc942ef989f177ca69072ea47162cfb4768a0338d83"
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
